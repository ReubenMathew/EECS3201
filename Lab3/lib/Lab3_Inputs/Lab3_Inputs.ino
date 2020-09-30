int pins[9] = {3,4,5,6,7,8,9,10,11};
void setup() {
  Serial.begin(9600);
  Serial.write("Initializing...\n");
  for (int i = 0; i < 9; i++){
    pinMode(pins[i],OUTPUT);
  }
  delay(1000);
}

void binOut(String num1, String num2, boolean subBit){
// Subtraction Control bit
  if (subBit){
    digitalWrite(pins[8], HIGH);
  }else{
    digitalWrite(pins[8], LOW);
  }
// 4 Bit input A
  Serial.println("---NUM1---");
  for(int i = 0; i < 4; i++){
    Serial.println(num1.charAt(i));
    if(num1.charAt(i) == '1'){
      digitalWrite(pins[7-i],HIGH);
    }else{
      digitalWrite(pins[7-i],LOW);
    }
    delay(100);
  }
//  4 Bit input B
  Serial.println("---NUM2---");
  for(int i = 3; i >= 0; i--){
    Serial.println(num2.charAt(i));
    if(num2.charAt(i) == '1'){
      digitalWrite(pins[3-i],HIGH);
    }else{
      digitalWrite(pins[3-i],LOW);
    }
    delay(100);
  }

}

void loop() {
  
  binOut("1010","0001",false);
  delay(8000);
  binOut("1110","1100",true);
  delay(8000);
  binOut("1100","1111",false);
  delay(8000);
  binOut("0100","1001",true);
  delay(8000);
}
