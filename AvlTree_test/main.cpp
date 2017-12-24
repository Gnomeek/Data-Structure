#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

#define OVERFLOW -1
#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

typedef int Status;
typedef int ElementType;

/*储存平衡二叉树结构声明*/
typedef struct AvlNode{
    ElementType element;    //数据域
    struct AvlNode *left;   //左右孩子指针域
    struct AvlNode *right;
    int height;             //树高
}AvlNode,*AvlTree;

/*存放输入数据的数组结构体*/
typedef struct ArrayNode{
    ElementType element;
    ArrayNode *next;
}ArrayNode, *Array;

/*链队列结构体*/
typedef struct LQNode{
    AvlTree element;
    struct LQNode *next;
}LQNode, *QueuePtr;

/*队列结点结构体*/
typedef struct{
    QueuePtr front;
    QueuePtr rear;
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
        T=T->left;
    return T;
}

/*寻找最大结点*/
AvlTree AvlTree_Max(AvlTree &T){
    if(NULL==T)
        return NULL;
    while(T->right!=NULL)
        T=T->right;
    return T;
}

/*右旋*/
AvlTree SingleRotate_Left(AvlTree &T2){
    AvlTree T1=(AvlNode*)malloc(sizeof(AvlNode));
    T1=T2->left;
    T2->left=T1->right;
    T1->right=T2;
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->left),T2->height)+1;
    return T1;
}

/*左旋*/
AvlTree SingleRotate_Right(AvlTree &T2){
    AvlTree T1=(AvlNode*)malloc(sizeof(AvlNode));
    T1=T2->right;
    T2->right=T1->left;
    T1->left=T2;
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->right),T2->height)+1;
    return T1;
}

/*先左旋再右旋*/
AvlTree DoubleRotate_Left(AvlTree &T3){
    T3->left=SingleRotate_Right(T3->left);
    return SingleRotate_Left(T3);
}

/*先右旋再左旋*/
AvlTree DoubleRotate_Right(AvlTree &T3){
    T3->right=SingleRotate_Left(T3->right);
    return SingleRotate_Right(T3);
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
    return T;
    /*if(x==T->element||T==NULL)
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
        T->left=AvlTree_Insert(x,T->left);
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
            if(x<T->left->element)
                T=SingleRotate_Left(T);     //LL情况,右旋
            else
                T=DoubleRotate_Left(T);     //LR情况,先左旋再右旋
        }
    }
    else if(x>T->element){
        T->right=AvlTree_Insert(x,T->right);
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            if(x>T->right->element)
                T=SingleRotate_Right(T);     //RR情况，左旋
            else
                T=DoubleRotate_Right(T);     //RL情况，先右旋再左旋
        }
    }
    T->height=MAX(AvlTree_Height(T->right),AvlTree_Height(T->left))+1;
    return T;
}

/*删除结点*/
AvlTree Delete(AvlTree &X,AvlTree &T){
    if(NULL==T||NULL==X)
        return NULL;
    if(X->element<T->element){
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
    else if(X->element>T->element){
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
    else{
        if((T->left!=NULL)&&(T->right!=NULL)){
            if(AvlTree_Height(T->left)>AvlTree_Height(T->right)){
                AvlNode *Max=(AvlNode*)malloc(sizeof(AvlNode));
                Max=AvlTree_Max(T->left);
                T->element=Max->element;
                T->left=Delete(Max,T->left);
            }
            else{
                AvlNode *Min=(AvlNode*)malloc(sizeof(AvlNode));
                Min=AvlTree_Min(T->right);
                T->element=Min->element;
                T->right=Delete(Min,T->right);
            }
        }
        else{
            AvlNode *temp=(AvlNode*)malloc(sizeof(AvlNode));
            temp=T;
            T=T->left ? T->left : T->right;
            free(temp);
        }
    }
    if(T)
		T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;
    return T;
}

AvlTree AvlTree_Delete(ElementType x,AvlTree &T){
    AvlTree N=(AvlNode*)malloc(sizeof(AvlNode));
    N=AvlTree_Find(x,T);
    if(N!=NULL){
        T=Delete(N,T);
        printf("Delete %d successfully.\n",x);
    }
    else
        printf("Delete failed.\n");
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
        if(FLAG==TRUE){
            head=p;
            q=p;
            FLAG=FALSE;
        }
        else{
            q->next=p;
            q=q->next;
        }
        LQueue_EnQueue(*Q,X);
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
    int n,m,k,i,j,o,choose,cho;
    AvlNode *TEMP=(AvlNode*)malloc(sizeof(AvlNode));
    while(1){
        system("cls");
        printf("******************Tree Table**********************\n");
        printf("\n************************T1************************\n\n");
        if(!T1)
            printf("Now T1 is NULL.\n");
        else
            AvlTree_Print(T1,0);
        printf("\n************************T2************************\n\n");
        if(!T2)
            printf("Now T2 is NULL.\n");
        else
            AvlTree_Print(T2,0);
        printf("\n******************Operation Table*****************\n");
        printf("\n T1   1.Create 2.Insert 3.Delete 4.Find 5.Destroy\n");
        printf("\n T2   6.Create 7.Insert 8.Delete 9.Find 10.Destroy\n");
        printf("\nT1&T2 11:Merge 12:Split\n");
        printf("\n******************Console Table*******************\n");
        printf("\nEnter number to choose operation:");
        scanf("%d",&choose);
        switch(choose){
            case 1:
                T1=Create(T1);
                break;
            case 2:{
                printf("Enter the element_key you want to insert:");
				scanf("%d",&n);
                T1=AvlTree_Insert(n,T1);
                break;
        	}
            case 3:{
                printf("Enter the element_key you want to delete:");
                scanf("%d",&m);
                T1=AvlTree_Delete(m,T1);
                getchar();
                getchar();
                break;
            }
            case 4:{
                printf("Enter the element_key you want to find:");
                scanf("%d",&k);
                TEMP=AvlTree_Find(k,T1);
                if(TEMP!=NULL)
                    printf("Find %d successfully.\n",k);
                else
                    printf("Find failed.\n");
                getchar();
                getchar();
                break;
        	}
            case 5:{
                AvlTree_Destroy(T1);
                printf("Destroy T1 Successfully.\n");
                break;
			}
			case 6:{
                T2=Create(T2);
                break;
			}
            case 7:{
                printf("Enter the element_key you want to insert:");
				scanf("%d",&i);
                T1=AvlTree_Insert(i,T2);
                break;
        	}
            case 8:{
                printf("Enter the element_key you want to delete:");
                scanf("%d",&j);
                T1=AvlTree_Delete(j,T2);
                getchar();
                getchar();
                break;
            }
            case 9:{
                printf("Enter the element_key you want to find:");
                scanf("%d",&o);
                TEMP=AvlTree_Find(o,T2);
                if(TEMP!=NULL)
                    printf("Find %d successfully.\n",o);
                else
                    printf("Find failed.\n");
                getchar();
                getchar();
                break;
        	}
        	case 10:{
                AvlTree_Destroy(T2);
                printf("Destroy T2 Successfully.\n");
                break;
        	}
            case 11:{
                printf("Merge T1 to T2(case 1)or T2 to T1(case 2)?\n");
                printf("Enter which case you choose:");
                scanf("%d",&cho);
                if(cho==1){
                    AvlTree_Merge(T2,T1);
                    T1=NULL;
                }
                if(cho==2){
                    AvlTree_Merge(T1,T2);
                    T2=NULL;
                }
                printf("Merge Successfully.\n");
                getchar();
                getchar();
                break;
			}
			/*case 12{

			}*/
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
