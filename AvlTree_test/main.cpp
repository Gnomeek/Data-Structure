#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0
#define OVERFLOW -2

typedef int Status;
typedef int ElementType;    //元素类型为整形类型

/*储存平衡二叉树结构声明*/
typedef struct AvlNode{
    ElementType element;    //数据域
    struct AvlNode *left;   //左右孩子指针域
    struct AvlNode *right;
    int height;             //树高
}AvlNode,*AvlTree;

/*存放输入数据的数组结构体*/
typedef struct ArrayNode{
    ElementType element;    //存放记录的结点元素值
    ArrayNode *next;        //指向下一个结点
}ArrayNode, *Array;

/*链队列结构体*/
typedef struct LQNode{
    AvlTree element;        //存放遍历时树的指针
    struct LQNode *next;    //指向下一个结点
}LQNode, *QueuePtr;

/*队列结点结构体*/
typedef struct{
    QueuePtr front;         //队头指针
    QueuePtr rear;          //队尾指针
}LQueue;

/*初始化链队列*/
Status LQueue_Init(LQueue &Q){
    Q.front = NULL;
    Q.rear= NULL;
    return OK;
}

/*链队列进队操作*/
Status LQueue_EnQueue(LQueue &Q, AvlTree &T){
    QueuePtr p=(LQNode*)malloc(sizeof(LQNode));
    if(NULL==p)
        return OVERFLOW;
    p->element=T;
    p->next=NULL;
    if(NULL==Q.front)
        Q.front=p;  //当先队列为空，直接插入空队列
    else
        Q.rear->next=p;  //当先队列非空，插在rear后
    Q.rear=p;            //更新rear
    return OK;
}

/*链队列出队操作*/
Status LQueue_DeQueue(LQueue &Q, AvlTree &T){
    QueuePtr p;
    if(NULL==Q.front)
        return ERROR;//当先队列为空
    p=Q.front;
    T=p->element;
    Q.front=p->next;
    if(Q.rear==p)
        Q.rear=NULL;//遍历完了整个队列
    free(p);
    return OK;
}

/*求树高*/
int AvlTree_Height(AvlTree &T){
    if(NULL==T)
        return 0;
    else
        return T->height;
}

/*比较取最大树高*/
int MAX(int T1,int T2){
    return T1>T2 ? T1 : T2;
}

/*寻找最小结点*/
AvlTree AvlTree_Min(AvlTree &T){
    if(NULL==T)
        return NULL;
    while(T->left!=NULL)
        T=T->left;      //找到了树最左下角的结点即为最小结点
    return T;
}

/*寻找最大结点*/
AvlTree AvlTree_Max(AvlTree &T){
    if(NULL==T)
        return NULL;
    while(T->right!=NULL)
        T=T->right;     //找到了树最右下角的结点即为最大结点
    return T;
}

/*右旋LL*/
AvlTree SingleRotate_Left(AvlTree &T2){
    AvlTree T1=(AvlNode*)malloc(sizeof(AvlNode));
    T1=T2->left;            //暂存T2的左孩子
    T2->left=T1->right;     //将T2的左孩子置为其原左孩子的右孩子(如必要)
    T1->right=T2;           //将T1的右孩子置为修正后的T2
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->left),T2->height)+1;      //修正树高
    return T1;              //此时T1更新为原根节点(T2)
}

/*左旋RR*/
AvlTree SingleRotate_Right(AvlTree &T2){
    AvlTree T1=(AvlNode*)malloc(sizeof(AvlNode));
    T1=T2->right;
    T2->right=T1->left;
    T1->left=T2;
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->right),T2->height)+1;
    return T1;              //LL情况的镜像处理
}

/*先左旋再右旋LR*/
AvlTree DoubleRotate_Left(AvlTree &T3){
    T3->left=SingleRotate_Right(T3->left);  //对T3的左孩子执行左旋操作(此时T3的左孩子变为了原左孩子的右孩子)
    return SingleRotate_Left(T3);           //对修正后的T3在执行一次右旋操作(此时根节点变为T3的左孩子，即原来的左孩子的右孩子)
}

/*先右旋再左旋RL*/
AvlTree DoubleRotate_Right(AvlTree &T3){
    T3->right=SingleRotate_Left(T3->right);
    return SingleRotate_Right(T3);          //LR情况的镜像处理
}

/*寻找结点*/
AvlTree AvlTree_Find(ElementType x,AvlTree &T){
    while ((T!=NULL)&&(T->element!=x))
    {
        if (x<T->element)
            T=T->left;
        else
            T=T->right;
    }
    return T;       //非递归写法
    /*递归写法
    if(x==T->element||T==NULL)
        return T;
    else if(x<T->element)
        return AvlTree_Find(x,T->left);
    else
        return AvlTree_Find(x,T->right);*/
}

/*创建结点*/
AvlTree AvlTree_Create(ElementType x,AvlNode *left,AvlNode *right){
    AvlTree p;

    p=(AvlNode*)malloc(sizeof(AvlNode));
    if(NULL==p)
        return NULL;
    p->element=x;
    p->left=left;
    p->right=right;
    p->height=0;
    return p;
}

/*插入结点*/
AvlTree AvlTree_Insert(ElementType x,AvlTree &T){
    if(NULL==T){
        T=AvlTree_Create(x,NULL,NULL);
        if(NULL==T){
            printf("ERROR\n");
            return NULL;
        }
    }
    else if(x<T->element){
        T->left=AvlTree_Insert(x,T->left);  //插入至左子树
        //失衡调整
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
            if(x<T->left->element)
                T=SingleRotate_Left(T);     //LL情况,右旋
            else
                T=DoubleRotate_Left(T);     //LR情况,先左旋再右旋
        }
    }
    else if(x>T->element){
        T->right=AvlTree_Insert(x,T->right);    //插入至右子树
        //失衡调整
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            if(x>T->right->element)
                T=SingleRotate_Right(T);     //RR情况，左旋
            else
                T=DoubleRotate_Right(T);     //RL情况，先右旋再左旋
        }
    }
    T->height=MAX(AvlTree_Height(T->right),AvlTree_Height(T->left))+1;  //修正高度
    return T;
}

/*删除结点*/
static AvlTree Delete(AvlTree &X,AvlTree &T){
    if(NULL==T)//空树或待删除结点为空
        return NULL;
    if(X->element<T->element){//待删除结点位于左子树
        T->left=Delete(X,T->left);
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            AvlNode *R=(AvlNode*)malloc(sizeof(AvlNode));
            R=T->right;
            if(AvlTree_Height(R->left) > AvlTree_Height(R->right))
                T=DoubleRotate_Right(T);
            else
                T=SingleRotate_Right(T);
        }
    }
    else if(X->element>T->element){//待删除结点位于右子树
        T->right=Delete(X,T->right);
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
            AvlNode *L=(AvlNode*)malloc(sizeof(AvlNode));
            L=T->left;
            if(AvlTree_Height(L->right) > AvlTree_Height(L->left))
                T=DoubleRotate_Left(T);
            else
                T=DoubleRotate_Left(T);
        }
    }
    else{                           //待删除结点为根节点
        if((T->left!=NULL)&&(T->right!=NULL)){
            if(AvlTree_Height(T->left)>AvlTree_Height(T->right)){
                AvlNode *Max=(AvlNode*)malloc(sizeof(AvlNode));     //在这种情况下，左子树高于右子树
                Max=AvlTree_Max(T->left);                           //取左子树中最大的结点作为新的根的替代品
                T->element=Max->element;                            //找到的这个新根依然满足左子树均小于它且右子树均大于他
                T->left=Delete(Max,T->left);                        //新根的左子树为删除替代品后的原左子树
            }
            else{
                AvlNode *Min=(AvlNode*)malloc(sizeof(AvlNode));     //这种情况下，右子树高于左子树，镜像操作
                Min=AvlTree_Min(T->right);
                T->element=Min->element;
                T->right=Delete(Min,T->right);
            }
        }
        else{
            AvlNode *temp=(AvlNode*)malloc(sizeof(AvlNode));        //在这种情况下，左右子树有一为空
            temp=T;                                                 //取不为空的那个作为新根
            T=T->left ? T->left : T->right;
            free(temp);
        }
    }
    if(T)
		T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;//修正高度
    return T;
}
/*AvlTree Delete(AvlTree &X,AvlTree &T){
    if(!T)
        return NULL;
    if(X->element<T->element)
        T->left=Delete(X,T->left);
    else if(X->element>T->element)
        T->right=Delete(X,T->right);
    else{
        if(T->left&&T->right){
            AvlTree TEMP=AvlTree_Min(T->right);
            T->element=TEMP->element;
            T->right=Delete(TEMP,T->right);
            if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
                if((T->left->right!=NULL)&&AvlTree_Height(T->left->right)>AvlTree_Height(T->left->left))
                    DoubleRotate_Left(T);
                else
                    SingleRotate_Left(T);
            }
        }
        else{
            AvlTree TEMP=T;
            T=T->left ? T->left : T->right;
            free(TEMP);
        }
    }
    if(T)
        T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;//修正高度(前提是T不为空)
    return T;
}
*/
AvlTree AvlTree_Delete(ElementType x,AvlTree &T){
    AvlTree N=(AvlNode*)malloc(sizeof(AvlNode));
    AvlTree TEMP=(AvlNode*)malloc(sizeof(AvlNode));
    TEMP=T;
    N=AvlTree_Find(x,T);
    if(N!=NULL){
        T=Delete(N,T);      //查找成功时，delete函数会修正T的
        printf("Delete %d successfully.\n",x);
    }
    else{
        printf("Delete failed.\n");
        T=TEMP;             //查找失败时，T和N均置为了NULL，将T=TEMP恢复其初始状态
    }
    return T;
}

/*先序遍历*/
Status AvlTree_PreOrderTraverse(AvlTree &T){
    if(T!=NULL){
        printf("%d ",T->element);
        AvlTree_PreOrderTraverse(T->left);
        AvlTree_PreOrderTraverse(T->right);
    }
}

/*中序遍历*/
Status AvlTree_InOrderTraverse(AvlTree &T){
    if(T!=NULL){
        AvlTree_PreOrderTraverse(T->left);
        printf("%d ",T->element);
        AvlTree_PreOrderTraverse(T->right);
    }
}

/*后序遍历*/
Status AvlTree_PostOrderTraverse(AvlTree &T){
    if(T!=NULL){
        AvlTree_PreOrderTraverse(T->left);
        AvlTree_PreOrderTraverse(T->right);
        printf("%d ",T->element);
    }
}

/*销毁*/
Status AvlTree_Destroy(AvlTree &T){
    if (NULL==T)
        return ERROR;
    if (T->left != NULL)
        AvlTree_Destroy(T->left);
    if (T->right != NULL)
        AvlTree_Destroy(T->right);
    free(T);
    T=NULL;
}

/*创建*/
AvlTree Create(AvlTree &T){
    int number,i,j;
    printf("Enter how many nodes contain:");
    scanf("%d",&number);
    printf("Enter every nodes' element_key.\n");
    for(i=1;i<=number;i++){
        printf("NO.%d node's element_key : ",i);
        scanf("%d",&j);
        T=AvlTree_Insert(j,T);
    }
    return T;
    printf("Create Successfully.Press any key to return.\n");
    getchar();
    getchar();
    //return OK;

}

Array ChangeTreeToArray(AvlTree &T){
    Status FLAG=TRUE;
    ArrayNode *head=NULL;
    ArrayNode *p=NULL;
    ArrayNode *q=NULL;
    if(T==NULL)
        printf("The Tree is empty.\n");
    else{
        LQueue *Q=(LQueue*)malloc(sizeof(LQueue));
        Q->front=NULL;
        Q->rear=NULL;
        AvlTree X=T;
        p=(ArrayNode*)malloc(sizeof(ArrayNode));
        p->element=X->element;
        if(FLAG==TRUE){//数组中为空
            head=p;
            q=p;
            FLAG=FALSE;
        }
        else{
            q->next=p;
            q=q->next;
        }
        LQueue_EnQueue(*Q,X);   //queue负责遍历整个树，p指针不断向后移，q指针用来指示p的后继
        while(LQueue_DeQueue(*Q,X)){
            if(X->left!=NULL){
                p=(ArrayNode*)malloc(sizeof(ArrayNode));
                p->element=X->left->element;
                q->next=p;
                q=q->next;
                LQueue_EnQueue(*Q,X->left);
            }
            if(X->right!=NULL){
                p=(ArrayNode*)malloc(sizeof(ArrayNode));
                p->element=X->right->element;
                q->next=p;
                q=q->next;
                LQueue_EnQueue(*Q,X->right);
            }
        }
        if(q!=NULL)
            q->next=NULL;
    }
    return head;
}

/*合并*/
AvlTree AvlTree_Merge(AvlTree &T1,AvlTree &T2){
    ArrayNode *a=(ArrayNode*)malloc(sizeof(ArrayNode));
    a=ChangeTreeToArray(T2);
    while(a!=NULL){
        AvlTree_Insert(a->element,T1);
        a=a->next;
    }
    return T1;
}

/*分裂*/
Status AvlTree_Spilt(AvlTree &T,ElementType x,AvlTree &T1,AvlTree &T2){
    ArrayNode *a=(ArrayNode*)malloc(sizeof(ArrayNode));
    a=ChangeTreeToArray(T);
    if(T==NULL)
        return FALSE;
    else{
        while(a!=NULL){
            if(a->element<=x){
                AvlTree_Insert(a->element,T1);
                a=a->next;
            }
            else{
                AvlTree_Insert(a->element,T2);
                a=a->next;
            }
        }
    }
    return TRUE;
}
/*打印*/
Status AvlTree_Print(AvlTree &T, int dep){
    int i;
    if(T->right)
        AvlTree_Print(T->right,dep+1);
    for(i=0;i<dep;i++)
        printf("    ");
    printf("%d\n",T->element);
    if(T->left)
        AvlTree_Print(T->left,dep+1);
    return OK;
}

Status AvlTree_Test(AvlTree &T1,AvlTree &T2){
    int n,m,k,i,j,o,choose,cho_m,cho_s,x;
    AvlNode *TEMP=(AvlNode*)malloc(sizeof(AvlNode));
    while(1){
        system("cls");
        printf("******************Tree Table**********************\n");
        printf("\n************************T1************************\n\n");
        if(!T1)
            printf("Now T1 is NULL.\n");
        else{
            printf("******************Tree Shape**********************\n");
            AvlTree_Print(T1,0);
            printf("****************Tree Traverse*********************\n");
            printf(" PreOrderTraverse :");
            AvlTree_PreOrderTraverse(T1);
            printf("\n  InOrderTraverse :");
            AvlTree_InOrderTraverse(T1);
            printf("\nPostOrderTraverse :");
            AvlTree_PostOrderTraverse(T1);
        }
        printf("\n************************T2************************\n\n");
        if(!T2)
            printf("Now T2 is NULL.\n");
        else{
            printf("******************Tree Shape**********************\n");
            AvlTree_Print(T2,0);
            printf("****************Tree Traverse*********************\n");
            printf(" PreOrderTraverse :");
            AvlTree_PreOrderTraverse(T2);
            printf("\n  InOrderTraverse :");
            AvlTree_InOrderTraverse(T2);
            printf("\nPostOrderTraverse :");
            AvlTree_PostOrderTraverse(T2);
        }
        printf("\n******************Operation Table*****************\n");
        printf("\n T1   1.Create 2.Insert 3.Delete 4.Find 5.Destroy\n");
        printf("\n T2   6.Create 7.Insert 8.Delete 9.Find 10.Destroy\n");
        printf("\nT1&T2 11:Merge 12:Split\n");
        printf("\n******************Console Table*******************\n");
        printf("\nEnter number to choose operation :");
        scanf("%d",&choose);
        switch(choose){
            case 1:
                T1=Create(T1);
                break;
            case 2:{
                printf("Enter the element_key you want to insert :");
				scanf("%d",&n);
                T1=AvlTree_Insert(n,T1);
                break;
        	}
            case 3:{
                printf("Enter the element_key you want to delete :");
                scanf("%d",&m);
                T1=AvlTree_Delete(m,T1);
                getchar();
                getchar();
                break;
            }
            case 4:{
                printf("Enter the element_key you want to find :");
                scanf("%d",&k);
                TEMP=T1;
                if((AvlTree_Find(k,T1))!=NULL)
                    printf("Find %d successfully.\n",k);
                else
                    printf("Find failed.\n");
                getchar();
                getchar();
                T1=TEMP;
                break;
        	}
            case 5:{
                AvlTree_Destroy(T1);
                printf("Destroy T1 Successfully.\n");
                getchar();
                getchar();
                break;
			}
			case 6:{
                T2=Create(T2);
                break;
			}
            case 7:{
                printf("Enter the element_key you want to insert :");
				scanf("%d",&i);
                T1=AvlTree_Insert(i,T2);
                break;
        	}
            case 8:{
                printf("Enter the element_key you want to delete :");
                scanf("%d",&j);
                T1=AvlTree_Delete(j,T2);
                getchar();
                getchar();
                break;
            }
            case 9:{
                printf("Enter the element_key you want to find :");
                scanf("%d",&o);
                TEMP=T2;
                if((AvlTree_Find(o,T2))!=NULL)
                    printf("Find %d successfully.\n",o);
                else
                    printf("Find failed.\n");
                T2=TEMP;
                getchar();
                getchar();
                break;
        	}
        	case 10:{
                AvlTree_Destroy(T2);
                printf("Destroy T2 Successfully.\n");
                getchar();
                getchar();
                break;
        	}
            case 11:{
                printf("Merge T1 to T2(case 1)or T2 to T1(case 2)?\n");
                printf("Enter which case you choose :");
                scanf("%d",&cho_m);
                if(cho_m==1){
                    AvlTree_Merge(T2,T1);
                    T1=NULL;
                }
                if(cho_m==2){
                    AvlTree_Merge(T1,T2);
                    T2=NULL;
                }
                printf("Merge Successfully.\n");
                getchar();
                getchar();
                break;
			}
			case 12:{
			    AvlTree T3=(AvlNode*)malloc(sizeof(AvlNode));
			    T3=NULL;
			    printf("Which Tree you want to spilt,T1(case1) or T2(case2)?\n");
			    printf("Enter which case you choose :");
			    scanf("%d",&cho_s);
			    printf("Enter the spilt key :");
			    scanf("%d",&x);
			    if(cho_s==1){
                    AvlTree_Spilt(T1,x,T3,T2);
                    T1=T3;
                    AvlTree_Destroy(T3);
			    }
			    if(cho_s==2){
                    AvlTree_Spilt(T2,x,T1,T3);
                    T2=T3;
                    AvlTree_Destroy(T3);
			    }
			    printf("Split Successfully.");
                getchar();
                getchar();
			    break;
			}
        }
    }
}

int main(){
    AvlNode *T1=(AvlNode*)malloc(sizeof(AvlNode));
    T1=NULL;
    AvlTree T2=(AvlNode*)malloc(sizeof(AvlNode));
    T2=NULL;
    AvlTree_Test(T1,T2);
}
