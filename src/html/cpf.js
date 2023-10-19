function calcularDigitosVerificadores(cpf) {
  cpf = cpf.replace(/[^\d]/g, ''); // Remova todos os caracteres não numéricos

  if (cpf.length !== 11) {
    return false; // CPF deve ter 11 dígitos
  }

  const digitos = cpf.split('').map(Number);
  const somaPrimeiroDigito = digitos.slice(0, 9).reduce((acc, val, idx) => acc + val * (10 - idx), 0);
  const restoPrimeiroDigito = somaPrimeiroDigito % 11;
  const primeiroDigito = restoPrimeiroDigito < 2 ? 0 : 11 - restoPrimeiroDigito;

  if (digitos[9] !== primeiroDigito) {
    return false; // O primeiro dígito verificador não corresponde
  }

  const somaSegundoDigito = digitos.slice(0, 10).reduce((acc, val, idx) => acc + val * (11 - idx), 0);
  const restoSegundoDigito = somaSegundoDigito % 11;
  const segundoDigito = restoSegundoDigito < 2 ? 0 : 11 - restoSegundoDigito;

  return digitos[10] === segundoDigito;
}

const cpfValido = '123.456.789-09'; // Substitua pelo CPF que você deseja verificar
const valido = calcularDigitosVerificadores(cpfValido);

if (valido) {
  console.log('O CPF é válido.');
} else {
  console.log('O CPF é inválido.');
}

