# Pogodipjesmuizmjena

## Originalni Readme

kviz pogađanja pjesme ili izvođača...

Koristi se biblioteka Minim za zvuk.

Deklaracija potrebnih varijabli.

#void setup() Inicijalizacija varijabli. Učitavanje potrebnih datoteka. Random odabiranje odgovora koji se spremaju u polje tocni_odgovori[], također kad se izabere random odgovor, pjesma s odgovarajućim naslovom spremi se u listu pjesama song (ukupno 5 pjesama).

#void draw() Na početku je status=pocetak=0, prikazuje se mogućnost odabira između "Pogodi pjesmu" i "Pogodi izvođača", ukoliko je kliknuto na prvo status se mijenja u pitanja=1, inače u pitanja1=2. ##status=pitanja i status=pitanja1 Dok indeks nije jednak 5, poziva se funkcija generiraj_odgovore(int i) i u tom razdoblju se status ne mijenja. ##status=kraj Ispisuju se osvojeni bodovi i pravokutnik s mogučnošću "Igraj ponovo".

#void mousePressed() Prvi put kad je stisnuta tipka miša pokreće poziva se millis() pomoću koje znamo ukupno vrijeme igranja što utječe na bodove. Ovisno o mjestu gdje smo kliknuli dobivaju se bodovi ako se kliknulo na točan odgovor. Nakon klika na jedan od ponuđenih odgovora zazeleni se točan odgovor. Ukoliko se klikne na mjesto izvan pravokutnika ne događa se ništa. Ukoliko se klikne unutar pravokutnika s "Pusti ponovo" pjesma se pušta još jednom (ovo trenutno ne radi!). Ovisno o varijabli status preskače se na iduće pitanje.

#void generiraj_odgovore(int i) Funkcija koja se poziva kod svakog novog pitanja. Na temelju trenutnog točnog odgovora koji se nalazi na odgovarajućem indeksu traže se random drugi odgovori i spremaju u polje ponudeni_odgovori[] (skupa s tocnim odgovorom koji je na 1.mjestu u polju), koji su svi međusobno različiti. Kako se točan odgovor prilikom svakog novog pitanja ne bi uvijek nalazio na istom mjestu generira se random poredat koji se sprema u polje rand_indeks[]. ##void nacrtaj_odgovore(int i) Ispisuje elemnte od ponudeni_odgvori[] na mjestu prema rand_indeks[].

## Dodano

#void setup() Osigurano da se niti jedna od 5 pjesama ne ponavlja u listi. Tu je postavljeno pozivanje millis() da bi se izbjeglo da vrijeme nastavlja teči od prethodne igre kad korisnik odabere "Igraj ponovo".

#void draw() Ništa nije izmjenjeno.

#void mousePressed() Još jedna izmjena vezana za millis() iz istog razloga, te dodano korištenje nove funkcije zacrveni() koja zacrveni odgovor koji je igrač pogrešno odabrao.

#void generiraj_odgovore(int i) Ništa nije izmjenjeno.
