/*
 ============================================================================
 Name        : teste.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */
#include <stdio.h>
#include <stdlib.h>

extern int ex1(int a);
extern int maximo(int *a, int n);
extern int contadorIntervalo(int *a, int n, int min, int max);

extern int ocorrencias(char *a, char val);

extern int copy_vector(int *a, int *b, int n);

extern int POS1msb(long int n);
extern int NCAP(int n);

extern int intern(int *a, int *b, int nElem);

extern double VF5(float *x, float *y, int n);
extern long int VF6(float *x, int n, float a, float b);

extern double cos(double x);

// TPCS

extern int xAinAB(int *ap, int n, int a, int b);
extern int CheckRange( int lim, int tam, int *seq);
extern int CountCommon (unsigned int, int *seq_A, unsigned int, int *seq_B);
extern void eStep(unsigned int N, float *seq_P , unsigned int M, double *seq_C, unsigned int *seq_Out);
extern char freqchars(unsigned int N, char *text, char nl, char *lett, float *freq);

/*
void ex1Base(void){
	int dim = 5;
	int v[] = {3, -1, 8, 0, -3}; // Para testar
	int res;
//	res = ex1(v, dim);
	printf("Soma dos elementos = %d\n", res);

}


void ex2aBase(void){
	int dim = 5;
	int v[] = {3, -1, 8, 0, -3}; // Para testar
	int res;
	res = maximo(v, dim);
	printf("Valor maximo = %d\n", res);
}

void ex2eBase(void){
	int dim = 5;
	int v[] = {3, -1, 8, 0, -3}; // Para testar
	int min = -2;
	int max = 8;
	int res;
	res = contadorIntervalo(v, dim, min, max);
	printf("Numero de valores entre %d e %d: %d\n",min, max, res);
}

void ex3bBase(void){
	char v[] = "Aaaaaaa";
	char val = 'a';

	int res;
	res = ocorrencias(v, val);
	printf("Numero de ocorrencias de %c é %d", val, res);
}

void ex4bBase(void){
	int a[] = {1,2,5,3,-4,5, -7};
	int dim = 7;
	int b[dim];
	copy_vector(a, b, dim);
	for (int i = 0; i < dim; i++){
		printf(b[i]);
	}
}

void ex5aBase(){
	long int n = 12343141;
	int pos;
	//pos = POS1msb();
}

void ex5eBase(){

}

void ex7eBase(){

	int a[] = {1,4,35555555,1, 2};
	int b[] = {5,4,15555555,1,7};
	int nElem = 5;

	int res = intern(a, b, nElem);
	printf("Tem %d", res);
}



void tpc1(void){
  int n = 8;
  int v[] = {7, -2, 23,12,  16, 20, -10, 0, 4};
  int a = -2, b= 16;
  int res;          // fazer testes adicionais com outros dados

  res = xAinAB(v, n, a, b);
  printf("Ha %d valores do vetor multiplos de %d e que pertencem a [%d; %d].\n", res, a, a, b);
}


void tpc2(void)
{
	 int limiar = 20;
	 int tamanho = 8;
	 int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
	 int res;

	 res = CheckRange(limiar, tamanho, ve);
	 printf("Foram modificados %d elementos da sequencia ve[]", res);
	 printf("\n###########\n");
	 for (int x = 0; x < 8; x++){
		 printf("%d ", ve[x]);
	 }
	// para o exemplo fornecido o output deve indicar que foram alterados 3 elementos

	// no final da execuçao a sequencia ve[] = {7, -8, -20, 20, 20, -10, 0, 20} (podem verificar

	//o seu conteúdo durante a execução em modo debug)
}


void tpc3(void)
{
	unsigned int tamA= 8, tamB=3;
	int vectA[] = {7, -8, -5, -2, -5, -2, 40, 7};
	int vectB[] = {5, 7, -2};
	unsigned int res;

	res = CountCommon(tamA, vectA, tamB, vectB);
	printf("Número de elementos de vectA[] em vectB[]: %u\n", res);

	// para o exemplo fornecido, o número de elementos indicado na mensagem é 4.
}

void tpc4(void)
{
unsigned int size = 6;
int vectA[] = {2, 8, 4, 5, 13, 25};
//int vectB[] = {2, 3, 5, 1, 13, -25}; // com overflow : exemplo (a)
int vectB[] = {1, 2, 3, 0, 2, -25}; // sem overflow  : exemplo (b);
char vectOP[] = {'+', 'P', '*', '-','P', '+'};

//int execucao = Calculator(size, vectOP, vectB, vectA);

int i;
if (execucao){
    printf("Overflow na operação %d\n", execucao);
    for (i = 1; i < execucao; i++)
        printf("elemento %d resultado = %d\n", i, vectA[i-1]);}
else
    for (i = 1; i <= size; i++)
        printf("elemento %d resultado = %d\n", i , vectA[i-1]);
}
*/


void testTPC4(){
	unsigned int N = 5, M = 3;
	float seq_P[] = {-3.1, 0, 2.5, -2, 3, 2, 0.5, 1, -5, -1};
	double seq_C[] = {-2, -2, 0, 0, 2, 2};
	unsigned int seq_Out[N];

	eStep(N, seq_P, M, seq_C, seq_Out);

	for(int i = 0; i < N; i++){
		printf("O ponto %d da seq_P (%f, %f) tem como ponto da seq_C mais próximo o ponto de índice %d (%f, %f)\n",
				i, seq_P[i*2], seq_P[i*2 + 1], seq_Out[i], seq_C[seq_Out[i]*2], seq_C[seq_Out[i]*2 + 1]);
	}
}

/*
int tpc5(void)
{
    unsigned int N = 48;
    char text[] = "A funcao retorna a frequencia absoluta da letra ";
    char nl = 4;
    char lett[] = {'p', 'a', 'u', 'r'};
    float freq[nl];
    char buf[10];

    char res = freqchars(N, text, nl, lett, freq);

    if (nl)
        for(int i = 0; i < nl; i++) {
        	printf("a letra '%c' ocorre em %f do texto.\n", lett[i], buf, freq[i]);
        }
    if (res)
        printf("Das letras pesquisadas no texto, '%c' é a mais frequente.\n", res);

        // Neste exemplo, 'freq' deverá conter {0, 18.8, 6.25, 8.33} após a execução da sub-rotina
        // e 'a' é o carater mais frequente.
    return EXIT_SUCCESS;
}

*/

extern int estudo1(char a[]);

void testEstudo1(){
	char text[] = "((({()})))";
	int res = estudo1(text);
	printf("Resultado %d", res);
}

int main(void) {
	testEstudo1();

}
