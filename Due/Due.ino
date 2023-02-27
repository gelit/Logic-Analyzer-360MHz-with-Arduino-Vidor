// Generator tested on Arduino Due with 7 outputs (2-)

void setup() {
                               // 22 fév from https://forum.arduino.cc/t/arduino-due-route-internal-clock-to-pckx/212322/8
                               // 12 MHz (T=83 ns) sur pin CAN Rx                                
  REG_PIOA_WPMR = 0x50494F00;  // enable writes
  REG_PIOA_PDR |= 0x02;        // enable peripheral control
  REG_PIOA_PER &= ~0x02;        // Prevents disabling peripheral control of the pin
  REG_PIOA_ABSR |= 0x02;       // B preipherial select
  REG_PIOA_WPMR = 0x50494F01;  // disable writes

  REG_PMC_WPMR = 0x504D4300;   // enable writes
  REG_PMC_SCER |= 0x100;
  PMC->PMC_PCK[0] = 0x1;       // master clock = 12Mhz (crystal freq)
  REG_PMC_WPMR = 0x504D4301;   // disable writes

  Serial.begin(115200); Serial.println("Hi");
  pinMode(2,OUTPUT); pinMode(3,OUTPUT); pinMode(4,OUTPUT);
  digitalWrite(2,0); digitalWrite(3,0); digitalWrite(4,0);
}

void loop() {
  if (Serial.available() > 0) {
    byte Y = Serial.read();  // consommer

    digitalWrite(2,1); digitalWrite(2,0);  // D1=Trigger   
    digitalWrite(3,1); digitalWrite(3,0);
    digitalWrite(4,1); digitalWrite(4,0);
    
  }
}



