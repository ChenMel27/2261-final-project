# 1 "analogSound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "analogSound.c"
# 1 "analogSound.h" 1
# 257 "analogSound.h"
enum note {

  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

typedef struct noteWithDuration {
  enum note note;
  unsigned char duration;
} NoteWithDuration;

void initSound();
void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime);
void playNoteWithDuration(NoteWithDuration *n, unsigned char duty);
void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty);
void playAnalogSound(unsigned short sound);
# 2 "analogSound.c" 2



void initSound(){

  *(volatile unsigned short*)0x04000084 = (1<<7);


  *(volatile unsigned short*)0x04000080 = (((5) & 7) << 0) |
                   (((5) & 7) << 4) |
                   (1 << 8) |
                   (1 << 12) |
                   (1 << 9) |
                   (1 << 13) |
                   (1 << 10) |
                   (1 << 14) |
                   (1 << 11) |
                   (1 << 15);

  *(volatile unsigned short*)0x04000082 = ((2) % 3);
}

void playNoteWithDuration(NoteWithDuration *n, unsigned char duty){
  if (n->note != REST) {
    *(volatile unsigned short*)0x04000068 = (((15) & 15) << 12) | (((duty) & 3) << 6) | (64 - n->duration*256/1000);
    *(volatile unsigned short*)0x0400006C = n->note | (1<<15) | (1<<14);
  } else {
    *(volatile unsigned short*)0x04000068 = 0;
    *(volatile unsigned short*)0x0400006C = 0;
  }
}

void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty){
  *(volatile unsigned short*)0x04000062 = (((15) & 15) << 12) | (envDir && (1 << 11)) | (((envStepTime) & 7) << 8) | (((duty) & 3) << 6) | ((length) & 63);
  *(volatile unsigned short*)0x04000064 = note | (1<<15) | (1<<14);
  *(volatile unsigned short*)0x04000060 = ((sweepShift) & 7) | (((sweepTime) & 7) << 4) | (sweepDir && (1 << 3));
}

void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime){
  *(volatile unsigned short*)0x04000078 = (((15) & 15) << 12) | (((steptime) & 7) << 8) | ((length) & 63);
  *(volatile unsigned short*)0x0400007C = (1<<15) | (1<<14) | (((s) & 15) << 4) | (((b) ? 1 : 0) << 3) | (((r) & 7));
}

void playAnalogSound(unsigned short sound){
  switch (sound){
    case 0:
      playDrumSound(0, 0, 0, 20, 1);
      break;
    case 1:
      playDrumSound(1, 3, 1, 32, 2);
      break;
    case 2:
      playDrumSound(0, 7, 0, 30, 5);
      break;
    case 3:
      playDrumSound(0, 7, 1, 30, 5);
      break;
    case 4:
      playDrumSound(0, 9, 1, 0, 1);
      break;
    case 5:
      playDrumSound(3, 3, 1, 30, 1);
      break;
    case 6:
      playDrumSound(7, 1, 1, 32, 0);
      break;
    case 7:
      playDrumSound(0, 9, 0, 32, 3);
      break;
    case 8:
      playChannel1(NOTE_G4, 0, 7, 3, 0, 1, 0, 0);
      break;
    case 9:
      playChannel1(NOTE_A4, 0, 4, 3, 1, 1, 0, 0);
      break;
    case 10:
      playChannel1(NOTE_D4, 0, 4, 3, 1, 1, 0, 2);
      break;
    case 11:
      playChannel1(NOTE_G4, 10, 7, 1, 1, 2, 1, 2);
      break;
    case 12:
      playChannel1(NOTE_E4, 0, 7, 1, 1, 4, 1, 2);
      break;
    case 13:
      playChannel1(NOTE_G4, 0, 7, 2, 1, 4, 1, 2);
      break;
    case 14:
      playChannel1(NOTE_E4, 1, 4, 2, 0, 2, 0, 2);
      break;
    case 15:
      playChannel1(NOTE_DS4, 5, 4, 2, 0, 2, 0, 2);
      break;
    case 16:
      playChannel1(NOTE_G4, 0, 4, 7, 1, 2, 1, 2);
      break;
    case 17:
      playChannel1(NOTE_A4, 0, 5, 7, 1, 4, 1, 3);
      break;
    default:
      break;
  }
}
