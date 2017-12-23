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

/*储存结构声明*/
typedef struct AvlNode{
    ElementType element;    //数据域
    struct AvlNode *left;   //左右孩子指针域
    struct AvlNode *right;
    int height;             //树高
}AvlNode,*AvlTree;

/*求树高*/
int AvlTree_Height(AvlTree T){
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
AvlTree AvlTree_Min(AvlTree T){
    if(NULL==T)
        return NULL;
    while(T->left!=NULL)
        T=T->left;
    return T;
}

/*寻找最大结点*/
AvlTree AvlTree_Max(AvlTree T){
    if(NULL==T)
        return NULL;
    while(T->right!=NULL)
        T=T->right;
    return T;
}

/*右旋*/
AvlTree SingleRotate_Left(AvlTree T2){
    AvlTree T1=T2->left;
    T2->left=T1->right;
    T1->right=T2;
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->left),T2->height)+1;
    return T1;
}

/*左旋*/
AvlTree SingleRotate_Right(AvlTree T2){
    AvlTree T1=T2->right;
    T2->right=T1->left;
    T1->left=T2;
    T2->height=MAX(AvlTree_Height(T2->left),AvlTree_Height(T2->right))+1;
    T1->height=MAX(AvlTree_Height(T1->right),T2->height)+1;
    return T1;
}

/*先左旋再右旋*/
AvlTree DoubleRotate_Left(AvlTree T3){
    T3->left=SingleRotate_Right(T3->left);
    return SingleRotate_Left(T3);
}

/*先右旋再左旋*/
AvlTree DoubleRotate_Right(AvlTree T3){
    T3->right=SingleRotate_Left(T3->right);
    return SingleRotate_Right(T3);
}

/*寻找结点*/
AvlTree AvlTree_Find(ElementType x,AvlTree T){
    if(x==T->element||T==NULL)
        return T;
    else if(x<T->element)
        return AvlTree_Find(x,T->left);
    else
        return AvlTree_Find(x,T->right);
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
AvlTree AvlTree_Insert(ElementType x,AvlTree T){
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
AvlTree Delete(AvlTree X,AvlTree T){
    if(NULL==T||NULL==X)
        return NULL;
    if(X->element<T->element){
        T->left=Delete(X,T->left);
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            if(AvlTree_Height(T->right->left) > AvlTree_Height(T->right->right))
                T=DoubleRotate_Right(T);
            else
                T=SingleRotate_Right(T);
        }
    }
    else if(X->element>T->element){
        T->right=Delete(X,T->right);
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
            if(AvlTree_Height(T->left->right) > AvlTree_Height(T->left->left))
                T=DoubleRotate_Left(T);
            else
                T=DoubleRotate_Left(T);
        }
    }
    else{
        if((T->left!=NULL)&&(T->right!=NULL)){
            if(AvlTree_Height(T->left)>AvlTree_Height(T->right)){
                AvlTree Max=AvlTree_Max(T->left);
                T->element=Max->element;
                T->left=Delete(Max,T->left);
            }
            else{
                AvlTree Min=AvlTree_Min(T->right);
                T->element=Min->element;
                T->right=Delete(Min,T->right);
            }
        }
        else{
            AvlTree temp=T;
            T=T->left ? T->left : T->right;
            free(temp);
        }
    }
    if(T)
		T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;
    return T;
}

AvlTree AvlTree_Delete(ElementType x,AvlTree T){
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
Status AvlTree_PreOrderTraverse(AvlTree T){
    if(T!=NULL){
        printf("%d ",T->element);
        AvlTree_PreOrderTraverse(T->left);
        AvlTree_PreOrderTraverse(T->right);
    }
}

/*中序遍历*/
Status AvlTree_InOrderTraverse(AvlTree T){
    if(T!=NULL){
        AvlTree_PreOrderTraverse(T->left);
        printf("%d ",T->element);
        AvlTree_PreOrderTraverse(T->right);
    }
}

/*后序遍历*/
Status AvlTree_PostOrderTraverse(AvlTree T){
    if(T!=NULL){
        AvlTree_PreOrderTraverse(T->left);
        AvlTree_PreOrderTraverse(T->right);
        printf("%d ",T->element);
    }
}

/*销毁*/
Status AvlTree_Destroy(AvlTree T){
    if (NULL==T)
        return ERROR;
    if (T->left != NULL)
        AvlTree_Destroy(T->left);
    if (T->right != NULL)
        AvlTree_Destroy(T->right);
    free(T);
}

/*创建*/
AvlTree Create(AvlTree T){
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

/*打印*/
Status AvlTree_Print(AvlTree T, int dep)
{
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

/*Status AvlTree_Test(AvlTree T){
    int n,m,k,choose;
    AvlTree TEMP=(AvlNode*)malloc(sizeof(AvlNode));
    while(1){
        system("cls");
        if(!T)
            printf("Now this tree is NULL.\n");
        else
            AvlTree_Print(T,1);
        printf("Operation Table: 1.Create 2.Insert 3.Delete 4.Find 5.Destroy\n");
        printf("Enter number to choose operation:");
        scanf("%d",&choose);
        switch(choose){
            case 1:
                T=Create(T);
                break;
            case 2:{
                printf("Enter the element_key you want to insert:");
				scanf("%d",&n);
                T=AvlTree_Insert(n,T);
                break;
        	}
            case 3:{
                printf("Enter the element_key you want to delete:");
                scanf("%d",&m);
                T=AvlTree_Delete(m,T);
                break;
            }
            case 4:{
                printf("Enter the element_key you want to find:");
                scanf("%d",&k);
                TEMP=AvlTree_Find(k,T);
                if(TEMP==NULL)
                    printf("Find %d successfully.\n",k);
                else
                    printf("Find failed.\n");
                break;
        	}
            case 5:{
                AvlTree_Destroy(T);
                printf("Destroy Successfully.\n");
                break;
			}
        }
    }
}*/
Status AvlTree_Test(AvlTree T){
	int a[6]={1,2,3,4,5,6};
	int i;
	for(i=0;i<=5;i++)
		T=AvlTree_Insert(a[i],T);
	AvlTree_Print(T,0);
	T=AvlTree_Delete(a[5],T);
	AvlTree_Print(T,0);
}

int main(){
    AvlTree T=(AvlNode*)malloc(sizeof(AvlNode));
    T=NULL;
    AvlTree_Test(T);
}
