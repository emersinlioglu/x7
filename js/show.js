function ibancheck() {
    
    // Zuerst prüfen wir, ob sowohl IBAN/BIC als auch KONTO/BLZ ausgewählt worden ist
    
    if ( 
            (document.getElementById('form_blz').value || document.getElementById('form_konto').value) &&
            (document.getElementById('form_bic').value || document.getElementById('form_iban').value)
        ) {alert ('Bitte füllen Sie entweder die Daten für Konto/BLZ oder für IBAN/BIC aus. Bitte nicht beide gemeinsam!');} else
        
        
        {
            
            // Es wurde nur eins ausgewählt. Also setzen wir bei diesem die Prüfungs-IDs um und schalten beim anderen die Prüfungs-IDs aus
            
        CloseDIV('fehler_iban' );
        CloseDIV('fehler_bic' );
        CloseDIV('fehler_konto' );
        CloseDIV('fehler_blz' );
        
    
        if ((document.getElementById('form_blz').value || document.getElementById('form_konto').value)) {
            
            document.getElementById('must_iban').value=0;
            document.getElementById('must_bic').value=0;
            document.getElementById('must_konto').value=4;
            document.getElementById('must_blz').value=3;
            
            }
            
            else {
            
            document.getElementById('must_iban').value=1;
            document.getElementById('must_bic').value=1;
            document.getElementById('must_konto').value=0;
            document.getElementById('must_blz').value=0;
            
            }
            

            
            
            
        }
    
    }

	function Show(e){

			document.getElementById(e).style.display = 'block';

	}
	
	function CloseDIV(e){
			document.getElementById(e).style.display = 'none';
	}
	
 	function BgChange(e){
		if(document.getElementById(e).className   == 'eingabeblock_on'){
			document.getElementById(e).className  = 'eingabeblock_off';
		}
		else{
			document.getElementById(e).className  = 'eingabeblock_on';
        }

	}
	
	function ShowOnly(e){
		if(document.getElementById(e).style.display == 'none'){
			document.getElementById(e).style.display = 'block';
		}
	}


	function SlideDown(id) {
 
	 window.setTimeout('$("#' + id + '").slideDown("slow");',0);
	 	 	 
	}

	function SlideUp(id) {
	 
	 window.setTimeout('$("#' + id + '").slideUp("slow");',0);
	 	 	 	  	 
	}

    function Slider(id) 
    
        {
            if (document.getElementById(id).style.display=='none') {SlideDown(id);} else {SlideUp(id);} 
        }
        	
function EMail(s)
{
 var a = false;
 var res = false;
 if(typeof(RegExp) == 'function')
 {
  var b = new RegExp('abc');
  if(b.test('abc') == true){a = true;}
  }

 if(a == true)
 {
  reg = new RegExp('^([a-zA-Z0-9\-\.\_]+)'+
                   '(\@)([a-zA-Z0-9\-\.]+)'+
                   '(\.)([a-zA-Z]{2,4})$');
  res = (reg.test(s));
 }
 else
 {
  res = (s.search('@') >= 1 &&
         s.lastIndexOf('.') > s.search('@') &&
         s.lastIndexOf('.') >= s.length-5)
 }
 return(res);
 }
 
function timecheck(datum)
{
	
	var bday=parseInt(datum.substring(0,2));
	var bmo2=datum.substring(3,5);
	var bmo=(bmo2);
	var byr=parseInt(datum.substring(6,10));
	if (bday<10) {bday='0' + bday;}
	
	var heute = new Date();

	var oyr=heute.getFullYear();
	var omo=heute.getMonth();
    omo = omo +1;
    
    if (omo<10) {omo='0' + omo;}
	
	var oday=heute.getDate();
	if (oday<10) {oday='0' + oday;}
	
	var timestamp = new Date(oyr,omo,oday).getTime();
	var timenow = new Date(byr,bmo,bday).getTime();

	returncode = false;
	if (timenow<timestamp) {returncode='past';}
	if (timenow>timestamp) {returncode='future';}
	if (timenow==timestamp) {returncode='past';}

	
	return returncode;
	
}

function Age(datum)
{

var bday=parseInt(datum.substring(0,2));
var bmo2=datum.substring(3,5);
var bmo=(bmo2 - 1);
var byr=parseInt(datum.substring(6,10));

var byr;
var age;
var now = new Date();
tday=now.getDate();
tmo=(now.getMonth());
tyr=(now.getFullYear());

{
if((tmo > bmo)||(tmo==bmo & tday>=bday))
{age=byr;}

else
{age=byr+1;}
calc_age=tyr-age;

if (isNaN(bmo2))  {calc_age=false;} 
if (isNaN(bday))  {calc_age=false;}
if (isNaN(byr))  {calc_age=false;}

if (bmo2==02 && bday>29) {calc_age=false;}
if (bmo2==04 && bday>30) {calc_age=false;}
if (bmo2==06 && bday>30) {calc_age=false;}
if (bmo2==09 && bday>30) {calc_age=false;}
if (bmo2==11 && bday>30) {calc_age=false;}

if (!isNaN(calc_age)) {return (calc_age);}
else {return false;}
}
}


   function zahlpruefung(wort) 
   { 
      ist_zahl=true;
      if(wort.length==0)
         ist_zahl=false;
      else 
         for(n=0;n<wort.length;n++)
            {if(wort.charAt(n)<"0"||wort.charAt(n)>"9")ist_zahl=false;}
      if(ist_zahl)
          return true;
      else
      {
          return false;
      } 
}
 
	function checkart(art_id,string)
	
	{
		
		verboten=0;
		
		if (art_id==1)	{if (string.length<1) {verboten=1;}}								// Normaler Text, ist was drin?
		if (art_id==2)	{if (EMail(string)==false) {verboten=1;}}							// Prüfung E-Mail
		if (art_id==3)	{if (string.length!=8 || !zahlpruefung(string)) {verboten=1;}}		// Prüfung 8-stellige Zahl / BLZ
		if (art_id==4)	{if (string.length<3 || !zahlpruefung(string)) {verboten=1;}}		// Prüfung mind. 3-stellige Zahl / Konto
		if (art_id==5)	{if (string.length!=5 || !zahlpruefung(string)) {verboten=1;}}		// Prüfung 5-stellige Zahl / PLZ
		if (art_id==6)	{if (Age(string)<18) {verboten=1;}}									// Prüfung auf ein Datum und ob 18 ist
		if (art_id==7)	{if (timecheck(string)!='past') {verboten=1;}}						// Datum darf nicht in Zukunft liegen
		if (art_id==8)	{if (timecheck(string)!='future') {verboten=1;}}					// Datum darf nicht in Vergangenheit liegen
		if (art_id==9)	{if (
						(string!=13 && document.getElementById('form_ausweisart').value!=2) ||
						(string==13 && document.getElementById('form_ausweisart').value==2) 
																		)	{verboten=1;}}	// Ausländische Staatsangehörigkeit nur mit ausländischem Reisepass
		if (art_id==10)	{if (Age(string)>-2) {verboten=1;}}									// Prüfung auf ein Datum und ob mindestens 1 Jahr in der Zukunft
		
		if (verboten==1) {return false;} else {return true;}
		
	}

	function checkAndSubmitJS(formname)
	{
		
	fehler=0;
	
	var count = 0;
	var fehlercounter = 0;
	
	var el = document.forms[formname].elements;

	for(i=0; i < el.length; i++)  {
	
		if (el[i].name.substr(0,5)=='must_' && el[i].name.substr(0,12)!='must_option_' && el[i].value>'0' ) 
		
			{
				// Schauen wie das Hauptfeld heisst
				
				feldname = (el[i].name.substr(5,64));
				
				// Unsichtbare Felder ( per display:none ) werden nicht geprüft und deren Wert wird auch genullt!
				
				sichtbar=1;
				if (document.getElementById('formreihe_' + feldname)) {
					
					if(document.getElementById('formreihe_' + feldname).style.display=='none') {document.getElementById('form_' + feldname).value='';sichtbar=0;} 
				
				}
				
				// Das Datum aus den Dropdown Feldern zusammenbauen
				
				if (el[i].value==6 || el[i].value==7 || el[i].value==8 || el[i].value==10) {document.getElementById('form_' + feldname).value=
					document.getElementById('d_' + feldname).value + '.' +
					document.getElementById('m_' + feldname).value + '.' + 
					document.getElementById('y_' + feldname).value  
				;}
				
				if (!checkart(el[i].value,document.getElementById('form_' + feldname).value) && sichtbar==1) 
					
					{
						fehler=1;
						Show('fehler_' + feldname );
						document.getElementById('form_' + feldname).className='error_input';
						fehlercounter++;
						
					} else {CloseDIV('fehler_' + feldname );}			
			
			}

  	}
		
	if (fehler==0) {document.getElementById(formname).submit();}	
	else {alert('Leider gibt es '+ fehlercounter +' Fehler bei Ihrer Eingabe. Bitte überprüfen Sie die rot markierten Felder und klicken dann auf Weiter.');}
	
	}	