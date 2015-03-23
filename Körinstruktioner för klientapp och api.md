
###K�rinstruktioner f�r API och Klientapp!

#Starta Apiet. 
1. B�rja med att �ppna upp filerna i PositionProjekt mappen i din Ruby milj�.
2. I Ruby consolen ska du se till att vara inne i PositionProject mappen, K�r F�ljande kommand:
rake db:migrate version=0
rake db:migrate
rake db:seed
rails s
3. navigera till 127.0.0.1:3000, logga in med denna anv�ndare:
email: test@test.se
password : 123
4. Fr�n sidan, g�r en ny app med "Regga app", ge den ett namn och spara
5. Ta nyckeln fr�n din applikation som du skapat, den ska du anv�nda n�r du s�tter upp klientapplikationen.
6. L�t den lokala ruby servern vara p� i bakgrunden och b�rja p� n�sta steg.

#Starta klientappen
1. B�rja med att �ppna upp filerna i klientsideProjekt mappen i din angular milj�. (sj�lv har jag k�rt WebStorm 9).
2. �ppna upp konsolen i webstorm (eller vilket IDE du nu k�r) och skriv in f�ljande kommandon:
npm install
3. Nu ska vi ta din api nyckel som du fick tag p� i f�rra delen (steg 5) och klistra in den i koden. 
Navigera till KlientsideProjekt>app>app.js 
I app.js filen s� ska du g� l�ngst ner, d�r hittar du konstanter. 
Manipulera denna kod:
app.constant("API", { 
    'apikey' : "apikey=XXXX",
    'baseUrl' : "http://127.0.0.1:3000/api/v1/"
});
D�r det st�r XXXX ska du klistra in nyckeln som du h�mtade. 
4. Nu �r allt f�rberett och du kan starta angular appen, det g�r du med detta kommando:
npm start
5. navigera till http://127.0.0.1:8000/app/
6. S�d�r nu �r allt klart f�r att prova appen, den �r lite "rough" men det g�r :) 
F�r att logga in anv�nd uppgifterna:
email: test@test.se
l�sen: 123