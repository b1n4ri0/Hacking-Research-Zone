#include <string.h>
#include <stdio.h>

char* tachar(char *texto, char simbolo){
	int longitud = strlen(texto);
	memset(texto, simbolo, longitud);
	return texto;
}

int main(){
	char texto[] = "Bienvenidos a Reverse ESP la mejor comunidad de low level";
	char simbolo = '@';
	printf("%s\n", tachar(texto, simbolo));
	return 0;
}