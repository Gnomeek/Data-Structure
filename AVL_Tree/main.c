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
int MAX(AvlTree T1,AvlTree T2){
    return T1->height>T2->height ? T1->height : T2->height;
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

/*插入结点*/
AvlTree AvlTree_Insert(ElementType x,AvlTree T){
    if(NULL==T){
        T=(AvlTree)malloc(sizeof(AvlNode));
        T->element=x;
        T->height=0;
        T->left=T->right=NULL;
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
    else if(x=T->element)
        return T;
    else if(x>T->element){
        T->right=AvlTree_Insert(x,T->right);
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            if(x>T->left->element)
                T=SingleRotate_Right(T);     //RR情况，左旋
            else
                T=DoubleRotate_Right(T);     //RL情况，先右旋再左旋
        }
    }
    T->height=MAX(AvlTree_Height(T->right),AvlTree_Height(T->left))+1;
    return T;
}

/*删除结点*/
AvlTree AvlTree_Delete(ElementType x,AvlTree T){
    if(NULL==T)
        return NULL;
    if(x<T->element){
        T->left=AvlTree_Delete(x,T->left);
        if(AvlTree_Height(T->right)-AvlTree_Height(T->left)==2){
            if(AvlTree_Height(T->left->left) > AvlTree_Height(T->left->right))
                T=DoubleRotate_Right(T);
            else
                T=SingleRotate_Right(T);
        }
    }
    else if(x>T->element){
        T->right=AvlTree_Delete(x,T->right);
        if(AvlTree_Height(T->left)-AvlTree_Height(T->right)==2){
            if(AvlTree_Height(T->right->right) > AvlTree_Height(T->right->left))
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
                T->left=AvlTree_Delete(Max->element,T->left);
            }
            else{
                AvlTree Min=AvlTree_Min(T->right);
                T->element=Min->element;
                T->right=AvlTree_Delete(Min->element,T->right);
            }
        }
        else{
            AvlTree temp=T;
            T=T->left ? T->left : T->right;
            free(temp);
        }
    }
    T->height=MAX(AvlTree_Height(T->left),AvlTree_Height(T->right))+1;
    return T;
}




































































































int main()
{
    printf("Hello world!\n");
    return 0;
}
