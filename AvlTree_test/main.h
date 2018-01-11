#ifndef main.h

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
Status LQueue_Init(LQueue &Q);
/*链队列进队操作*/
Status LQueue_EnQueue(LQueue &Q, AvlTree &T);
/*链队列出队操作*/
Status LQueue_DeQueue(LQueue &Q, AvlTree &T);
/*求树高*/
int AvlTree_Height(AvlTree &T);
/*比较取最大树高*/
int MAX(int T1,int T2);
/*右旋LL*/
AvlTree SingleRotate_Left(AvlTree &T2);
/*左旋RR*/
AvlTree SingleRotate_Right(AvlTree &T2);
/*先左旋再右旋LR*/
AvlTree DoubleRotate_Left(AvlTree &T3);
/*先右旋再左旋RL*/
AvlTree DoubleRotate_Right(AvlTree &T3);
AvlTree AvlTree_Find(ElementType x,AvlTree &T);
/*创建结点*/
AvlTree AvlTree_Create(ElementType x,AvlNode *left,AvlNode *right);
/*插入结点*/
AvlTree AvlTree_Insert(ElementType x,AvlTree &T);
/*删除结点*/
Status AvlTree_Delete(ElementType X,AvlTree &T);
/*中序遍历*/
Status AvlTree_InOrderTraverse(AvlTree &T);
/*销毁*/
Status AvlTree_Destroy(AvlTree &T);
/*创建*/
AvlTree Create(AvlTree &T);
/*将树转化为数组*/
Array ChangeTreeToArray(AvlTree &T);
/*合并*/
AvlTree AvlTree_Merge(AvlTree &T1,AvlTree &T2);
/*分裂*/
Status AvlTree_Spilt(AvlTree &T1,AvlTree &T2,ElementType x);
/*打印*/
Status AvlTree_Print(AvlTree &T, int dep);
/*测试*/
Status AvlTree_Test(AvlTree &T1,AvlTree &T2);
#endif // main
