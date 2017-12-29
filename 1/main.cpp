#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<time.h>
#define random(x) (rand()%x)
//本程序哈希表冲突处理方法采用链地址发
//头文件
#include <stdio.h>
#include <stdlib.h>

#define MAX_LENGTH 50
typedef struct node{
	int data;
	struct node *next;
}ElemNode;

typedef struct{
	ElemNode *first;
}ElemHeader,HashTable[MAX_LENGTH];

int n;//存储哈希表长度

void initHashTable(HashTable ht,int n);
void insert(HashTable ht,int ele);
ElemNode* search(HashTable ht,int ele);
void dele(HashTable ht,int ele);
int Hash(int ht);
int createHashTable(HashTable ht);

void showHashTable(HashTable ht);

void menu(HashTable ht);//菜单
//函数实现

void initHashTable(HashTable ht,int n){//初始化
	int i;
	for(i =0;i<n;i++){
		ht[i].first= NULL;
	}
}

void insert(HashTable ht,int ele){//插入
	int i;
	ElemNode *p;
	i=Hash(ele);
	p=(ElemNode *)malloc(sizeof(ElemNode));
//	p->key = ele;
	p->data = ele;
	p->next = ht[i].first;
	ht[i].first = p;
}

ElemNode* search(HashTable ht,int ele){//查找
	int i;
	ElemNode *p;
	i = Hash(ele);
	p=ht[i].first;
	while(p!=NULL && p->data != ele){
		p = p->next;
	}
	if(p!=NULL)
	{
		printf("",ele,i);
		return p;
	}
	else
	{
		printf("",ele);
		return p;
	}
}

void dele(HashTable ht,int ele){//删除指定数据
	int i;
	ElemNode *p,*q;
	i = Hash(ele);
	p=ht[i].first;
	if(p == NULL){
		printf("error occurred! ");
	}
	if(p->data == ele){
		ht[i].first = p->next;
	}
	else {
		q= p->next;
		while(q!=NULL && q->data != ele){
			p=q;
			q = q->next;
		}
		if(q == NULL){
			printf("error occurred! ");
		}
		else{
			p->next = q->next;
			free(q);
		}
	}
}

int Hash(int ht){//哈希函数
	int i;
	i = ht%n;
	return i;

}
int createHashTable(HashTable ht)//创建哈希表
{
	HashTable *p=ht;
	int ad[MAX_LENGTH]={0};
	int i;
	printf("");
	scanf("%d",&n);
	printf("",n);
	for(i=0;i<n;i++)
		scanf("%d",&ad[i]);
	initHashTable(p,n);
	for(i=0;i<n;i++)
		insert(p,ad[i]);
	return 1;
}

void showHashTable(HashTable ht)//显示哈希表
{
	int i;
	ElemNode *p;
	//i = Hash(ele);
	for(i=0;i<n;i++)
	{
		p=ht[i].first;
		if(p!=NULL)printf("",i);
		while(p!=NULL)
		{
			printf("%d ",p->data);
			p = p->next;
		}
		if(ht[i].first!=NULL)printf("\n");
	}
}


void menu(HashTable ht)
{
	int p,h;  //p 菜单选择；

	do
	{

      printf("input your select: ");

		scanf("%d",&p);
		switch(p)
		{
			case 1:createHashTable(ht);break;
			case 2:printf("\n");scanf("%d",&h);search(ht,h);break;
			case 3:printf("\n");scanf("%d",&h);dele(ht,h);printf("\n");break;
			case 4:printf("\n");scanf("%d",&h);insert(ht,h);printf("\n");break;
			case 5:showHashTable(ht);printf("\n");break;
			case 0:             break; //退出
			default:printf("\n");break;
		}
		system("pause");//系统暂停，提示按任意键继续。。。。
	}while(p!=0); //for do	}
}
//主函数
int main(){
	HashTable ht;
	menu(ht);//进入菜单循环
	return 0;
}
