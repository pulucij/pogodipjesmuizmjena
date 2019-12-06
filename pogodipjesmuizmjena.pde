import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
PImage img;
PFont font;

ArrayList<AudioPlayer> song;
AudioPlayer ponovljena_pjesma;
int[] indeksi;
int indeks;
int rand;
int rand_odgovor;
final int pocetak = 0;
final int pitanja = 1;
final int pitanja1 = 2;
final int kraj = 3;
int status;
String[] odgovori;
String[] tocni_odgovori;
String s;
int gotovo, gotovo1, gotovo2;
String[] ponudeni_odgovori;
int[] rand_indeks;
int izabrao_indekse;
int bodovi;
String odvojeno;
int ne_mijenjaj_indeks;
int m;
int pokreni_tajmer;
int cekaj;
int test;
int n; //dodano

void setup(){
  size(800, 600);
  font = loadFont("TimesNewRomanPSMT-32.vlw");
  img = loadImage("slika.jpg");
  odgovori = loadStrings("odgovori.txt");
  song = new ArrayList();
  indeksi = new int [3];
  tocni_odgovori = new String [5];
  ponudeni_odgovori = new String[4];
  rand_indeks = new int[4];
  indeks = 0;
  status = pocetak;
  bodovi = 0;
  ne_mijenjaj_indeks = 0;
  pokreni_tajmer = 1;
  cekaj = 0;
  for(int i=0; i<5; i++){ 
    test=1;
    while(test==1) //Ovdje je dodana while i for petlja, da se nijedno od tih pjesama ne ponovi
    {              //To olakšava igru jer igrač može naučiti koja je pjesma/izvođač tokom igre 
      rand = int(random(0,22)); //i onda sljedeći put točno odgovorit iako nije znao prije početka igre
      test=0;
      for(int j=0; j<i; j++)
      {
        if(tocni_odgovori[j]==odgovori[rand])
        {
          test=1;
          break;
        }
      }
    }
    minim = new Minim(this);
    song.add(minim.loadFile("pjesme/" +odgovori[rand] + ".mp3"));
    tocni_odgovori[i] = odgovori[rand];
  }  
  n=millis(); //Ovo je dodano
}

void draw(){  
  image(img, 0, 0);
  switch (status){
    
  case pocetak:
    
    textFont (font);
    text("Izaberi:", 100, 100); 
    fill(#D3BABA);
    rect(100, 285, 250, 40);
    rect(400, 285, 255, 40);
    fill(#382FC1);
    text(" Pogodi pjesmu", 125, 315);
    text(" Pogodi izvođača", 415, 315);  
    break;
    
  case pitanja: 
    if(cekaj == 1){       
      custom_delay(1200);      
      cekaj = 0; 
    }
    generiraj_odgovore(0);
    song.get(indeks).play();
    break;
    
  case pitanja1:   
    if(cekaj == 1){ 
      custom_delay(1200); 
      cekaj = 0; 
    }
    generiraj_odgovore(1);    
    song.get(indeks).play();
    break;
    
  case kraj:
    custom_delay(1200);
    textSize(48);
    text("Osvojeni bodovi:", 100, 200);
    if(bodovi - (int)m/2000 < 0) text(0, 465, 200); 
    else text(bodovi - (int)m/2000, 465, 200);
    fill(#D3BABA);    
    rect(100, 300, 150, 40);
    fill(#382FC1); 
    textSize(20);
    text(" Igraj ponovo", 120, 325);
    break;
  }   
}

void mousePressed(){ 
  if(pokreni_tajmer == 1){   
    m = millis()-n;        //Treba ovako jer inače nakon odabira da se ponovno igra, nastavlja teći vrijeme od prve igre 
    pokreni_tajmer = 0;    //i onda iako igrač dobro pogodi neće dobiti bodove koje zaslužuje jer je isteklo više vremena
  }                         //nego što stvarno jest u njegovoj igri
  ne_mijenjaj_indeks = 0;
  if(status == pitanja || status == pitanja1){
    if(mouseX<20 || mouseX>620 || mouseY<20 || (mouseY>60 & mouseY<70) || (mouseY>110 & mouseY<120) || 
    (mouseY>160 & mouseY<170) || (mouseY>210 & mouseY<400) || (mouseX>170 & mouseY>400 & mouseY<440) || mouseY>440){
      ne_mijenjaj_indeks = 1;      
    }
    if(mouseX>=20 & mouseX<=170 & mouseY>=400 & mouseY<=440){
      ne_mijenjaj_indeks = 1;
      if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      minim = new Minim(this);
      ponovljena_pjesma = minim.loadFile("pjesme/" + tocni_odgovori[indeks] + ".mp3"); //Ispravljeno, sitnica je nedostajala, ovaj string "pjesme/"
      song.get(indeks).close();
      ponovljena_pjesma.play();
    }    
    if(rand_indeks[0]==1 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=20 & mouseY<=60){
        bodovi = bodovi + 15;        
      }   
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 20, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==2 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=70 & mouseY<=110){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 70, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==3 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=120 & mouseY<=160){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 120, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==4 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=170 & mouseY<=210){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 170, 600, 40);
      precrtaj();      
    }    
  }
  if(ne_mijenjaj_indeks == 0){
  for(int i=0; i<4; i++){
    rand_indeks[i] = -1;
  }
  
  izabrao_indekse=0;
  gotovo = 0;
  gotovo1 = 0;
  gotovo2 = 0; 
  }
  switch(status){
    
    case pocetak:
      if(mouseX>100 & mouseX<350 & mouseY>285 & mouseY<315){      
        status=pitanja;      
      }      
      else if(mouseX>400 & mouseX<655 & mouseY>285 & mouseY<315){           
        status=pitanja1;      
      }
      break;
      
    case pitanja:
      if(ne_mijenjaj_indeks == 0){ 
        song.get(indeks).close(); 
        if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      }
      status=pitanja;
      if(ne_mijenjaj_indeks == 0){         
        indeks++;         
      }
      if(indeks == 5) status = kraj;
      break;
      
    case pitanja1:
      if(ne_mijenjaj_indeks == 0){
        song.get(indeks).close();
        if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      }
      status=pitanja1;
      if(ne_mijenjaj_indeks == 0){ 
        indeks++;         
      }     
      if(indeks == 5) status = kraj;
      break;
      
    case kraj:
      if(mousePressed == true & mouseX>100 & mouseX<250 & mouseY>300 & mouseY<340) setup();
      break;
  }   
}

void zacrveni() //Dodano da se igrač lakše snađe što je krivo stisnuo
{
  if(mouseX>=20 & mouseX<=620 & mouseY>=20 & mouseY<=60){
        fill(#D6331A);
        rect(20, 20, 600, 40);        
      }
  if(mouseX>=20 & mouseX<=620 & mouseY>=70 & mouseY<=110){
        fill(#D6331A);
        rect(20, 70, 600, 40);       
      }
  if(mouseX>=20 & mouseX<=620 & mouseY>=120 & mouseY<=160){
        fill(#D6331A);
        rect(20, 120, 600, 40);        
      }
  if(mouseX>=20 & mouseX<=620 & mouseY>=170 & mouseY<=210){
        fill(#D6331A);
        rect(20, 170, 600, 40);        
      }
}

void precrtaj(){
  fill(#382FC1);
  if(status == pitanja) nacrtaj_odgovore(0);
  else nacrtaj_odgovore(1);
  cekaj = 1;
}

void custom_delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void generiraj_odgovore(int i){
    fill(#D3BABA);
    rect(20, 20, 600, 40);
    rect(20, 70, 600, 40);
    rect(20, 120, 600, 40);
    rect(20, 170, 600, 40);
    rect(20, 400, 150, 40);
    fill(#382FC1); 
    textSize(20);
    text(" Pusti ponovo", 40, 425);
    if(ne_mijenjaj_indeks == 0){      
      ponudeni_odgovori[0] = tocni_odgovori[indeks];      
      int indeks_pamti = 0;
      int indeks_pamti1 = 0; 
      
      while(gotovo == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor]){
         ponudeni_odgovori[1] = odgovori[rand_odgovor];
         indeks_pamti = rand_odgovor;
         gotovo = 1;
       } 
      }
      
      while (gotovo1 == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor] & odgovori[indeks_pamti] != odgovori[rand_odgovor]){
         ponudeni_odgovori[2] = odgovori[rand_odgovor];
         indeks_pamti1 = rand_odgovor;
         gotovo1 = 1;          
       }        
      }
      
      while(gotovo2 == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor] & odgovori[indeks_pamti] != odgovori[rand_odgovor] & odgovori[indeks_pamti1] != odgovori[rand_odgovor]){
         ponudeni_odgovori[3] = odgovori[rand_odgovor];
         gotovo2 = 1;         
       } 
      }      
    
      if(izabrao_indekse == 0){
        rand_indeks[0] = int(random(1,5));
        while(rand_indeks[1] == -1){
         rand_indeks[1] = int(random(1,5));
         if(rand_indeks[1] == rand_indeks[0]){
           rand_indeks[1] = -1;
         }
        }
        while(rand_indeks[2] == -1){
         rand_indeks[2] = int(random(1,5));
         if(rand_indeks[2] == rand_indeks[0] || rand_indeks[2] == rand_indeks[1]){
           rand_indeks[2] = -1;
         }
        }
        while(rand_indeks[3] == -1){
         rand_indeks[3] = int(random(1,5));
         if(rand_indeks[3] == rand_indeks[0] || rand_indeks[3] == rand_indeks[1] || rand_indeks[3] == rand_indeks[2]){
           rand_indeks[3] = -1;
         }
        }
        izabrao_indekse=1;
      }
    }
    nacrtaj_odgovore(i);
}

void nacrtaj_odgovore(int i){
  for(int j=0; j<4; j++){      
    odvojeno = ponudeni_odgovori[j];
    String[] lista_odvojenog = split(odvojeno, "-");
    if(i == 0) text(" "+lista_odvojenog[1], 20, 45 + (rand_indeks[j]-1)*50);
    else text(" "+lista_odvojenog[0], 20, 45 + (rand_indeks[j]-1)*50);    
    }     
}





  
