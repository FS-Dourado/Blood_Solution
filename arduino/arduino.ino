const int lm35 = A0;
float temperatura;
void setup() {
  // put your setup code here, to run once:
  Serial.begin (9000);
}

void loop() {
  // put your main code here, to run repeatedly:
  int leitura = analogRead (lm35);
  temperatura = 0.09 * leitura + 1.71;
  Serial.println(temperatura);
  delay(2000);
}
