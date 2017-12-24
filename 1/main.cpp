#include<stdio.h>
#include<stdlib.h>


#define OVERFLOW -1
#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

//二叉树的链表存储定义
typedef struct TreeNode *position;
typedef char ElemType;

typedef struct TreeNode
{
	ElemType Data; //数据域
	TreeNode *Left;  //左孩子
	TreeNode *Right; //右孩子
}TreeNode,*BiTree;

void CreateBiTree(BiTree T);
void DestroyBiTree(BiTree T);
void PreOrderTraversal(BiTree T);
void InOrderTraversal(BiTree T);
void PostOrderTraversal(BiTree T);
int LeafCount(BiTree T);
int Depth(BiTree T);
int IsEmpty(BiTree T);

int main(void)
{
	BiTree T;
	printf("请输入一个先序序列二叉树，#代替空结点：\n");
	CreateBiTree(T);

	printf("该二叉树的深度为%d，叶节点数为%d\n",Depth(T),LeafCount(T));

	printf("先序遍历为：\n");
	PreOrderTraversal(T);

	printf("中序遍历为：\n");
	InOrderTraversal(T);

	printf("后序遍历为：\n");
	PostOrderTraversal(T);

	DestroyBiTree(T);
	if(IsEmpty(T))
		printf("该二叉树已删除。\n");
	printf("\n");

	return 0;
}



//构造二叉树
void CreateBiTree(BiTree T)  //先序序列构造二叉树
{
	ElemType Data;
	Data = getchar(); //获取先序序列
	if(Data == '#')
		T = NULL; // 结点为空
	else
	{
		T=(TreeNode*)malloc(sizeof(TreeNode));
		T->Data = Data;
		CreateBiTree(T->Left); //递归构造左子树
		CreateBiTree(T->Right);//递归构造右子树
	}
}

//销毁二叉树
void DestroyBiTree(BiTree T)
{
	if(T){
		DestroyBiTree(T->Left); //销毁左子树
		DestroyBiTree(T->Right); //销毁右子树
		free(T); //释放结点
	}
}

//先序遍历二叉树，根，左子树，右子树
void PreOrderTraversal(BiTree T)
{
	if(T)
	{
		printf("%d",T->Data); //打印根结点
		PreOrderTraversal(T->Left); //递归遍历左子树
		PreOrderTraversal(T->Right); //递归遍历右子树
	}
}

//中序遍历，左子树，根，右子树
void InOrderTraversal(BiTree T)
{
	if(T)
	{
		InOrderTraversal(T->Left);
		printf("%d",T->Data);
		InOrderTraversal(T->Right);
	}

}

//后序遍历，左子树，右子树，根
void PostOrderTraversal(BiTree T)
{
	if(T)
	{
		PreOrderTraversal(T->Left);
		printf("%d",T->Data);
		PreOrderTraversal(T->Right);
	}
}

//求数的叶子结点个数
int LeafCount(BiTree T)
{
	if(T==NULL)	return 0;  //树空
	if(T->Left==NULL && T->Right==NULL) return 1; //只有根结点
	else return LeafCount(T->Left)+LeafCount(T->Right);  //左子树叶节点个数+右子树叶节点个数
}

//求树的深度
int Depth(BiTree T)
{
	int LDepth,RDepth;
	if(T==NULL)
		return 0; //空树
	LDepth=Depth(T->Left); //递归求左子树的深度
	RDepth=Depth(T->Right); //递归求右子树的深度
	return (LDepth>RDepth)?(LDepth+1):(RDepth+1);
}

//判断树空
int IsEmpty(BiTree T)
{
	if(T) return ERROR;
	else return TRUE;
}
