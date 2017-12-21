#include <stdio.h>
#include <malloc.h>

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
        	AvlTree R=T->right;
            if(AvlTree_Height(R->left) > AvlTree_Height(R->right))
                T=DoubleRotate_Right(T);
            else
                T=SingleRotate_Right(T);
        }
    }
    else if(X->element>T->element){
        T->right=Delete(X,T->right);
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
        	AvlTree L=T->left;
            if(AvlTree_Height(L->right) > AvlTree_Height(L->left))
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
    //T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;
    return T;
}

AvlTree AvlTree_Delete(ElementType x,AvlTree T){
    AvlTree N=AvlTree_Find(x,T);
    if(N)
        T=Delete(N,T);
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

/*打印*/
Status AvlTree_Print(AvlTree T, ElementType x, int direction)
{
    if(T!= NULL)
    {
        if(direction==0)    // tree是根节点
            printf("%2d is root\n", T->element);
        else                // tree是分支节点
            printf("%2d is %2d's %6s child\n",T->element,x, direction==1?"right" : "left");

        AvlTree_Print(T->left,T->element,-1);
        AvlTree_Print(T->right,T->element,1);
    }
    return OK;
}

int main(){
    int i;
    AvlTree root=NULL;
    int arr[16]= {3,2,1,4,5,6,7,16,15,14,13,12,11,10,8,9};
    printf("== 高度: %d\n", AvlTree_Height(root));
    printf("== 依次添加: ");
    int ilen = 16;
    for(i=0; i<ilen; i++)
    {
        printf("%d ", arr[i]);
        root = AvlTree_Insert(arr[i],root);
    }

    printf("\n== 前序遍历: ");
    AvlTree_PreOrderTraverse(root);

    printf("\n== 中序遍历: ");
    AvlTree_InOrderTraverse(root);

    printf("\n== 后序遍历: ");
    AvlTree_PostOrderTraverse(root);
    printf("\n");

    printf("== 高度: %d\n", AvlTree_Height(root));
    printf("== 最小值: %d\n", AvlTree_Max(root)->element);
    printf("== 最大值: %d\n", AvlTree_Min(root)->element);
    printf("== 树的详细信息: \n");
    AvlTree_Print(root, root->element, 0);


    int j = 7;
    printf("\n== 删除根节点: %d", j);
    root = AvlTree_Delete(j,root);

    printf("\n== 高度: %d", AvlTree_Height(root));
    printf("\n== 中序遍历: ");
    AvlTree_InOrderTraverse(root);
    printf("\n== 树的详细信息: \n");
    AvlTree_Print(root, root->element, 0);

    // 销毁二叉树
    AvlTree_Destroy(root);
}


