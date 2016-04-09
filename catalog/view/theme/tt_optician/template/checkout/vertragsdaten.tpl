<script>
  $(function() {
    $( "#datepickergd" ).datepicker({
      
	  changeMonth: true,
      changeYear: true,
	  yearRange: "1938:1998",
	  dateFormat: 'dd.mm.yy',
    monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
    dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag','Samstag'],
    dayNamesMin: ['So', 'Mo', 'Die', 'Mi', 'Do', 'Fre', 'Sa']
    });
	
  });
  
   $(function() {
    $( "#datepickerag" ).datepicker({
      
	  changeMonth: true,
      changeYear: true,
	  yearRange: "2016:2036",
	  dateFormat: 'dd.mm.yy',
    monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember'],
    dayNames: ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag','Samstag'],
    dayNamesMin: ['So', 'Mo', 'Die', 'Mi', 'Do', 'Fre', 'Sa']
    });
	
  }); 
  </script>
    

<form id="vertragseingabe" name="vertragseingabe" method="post">
 <p>&nbsp;</p>
<table width="100%" border="0">
  <tr>
    <td colspan="2"><h1 style="margin-bottom:1px">I. Persönliche Angaben</h1><div class="formular_start"></div><div class="formular_body clearfix"></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_geburtsdatum" name="must_geburtsdatum" value="6">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_geburtsdatum" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Geburtsdatum</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="180" class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
     
   <!--  <select id="d_geburtsdatum" name="d_geburtsdatum"> -->
   <!--  <option value="--">---</option>  -->
   <!--  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
   <!--  </select>  -->

   <!--  <select id="m_geburtsdatum" name="m_geburtsdatum">
  <!--   <option value="--">---</option>
   <!--  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
     </select>  -->

   <!--  <select id="y_geburtsdatum" name="y_geburtsdatum">
    <!-- <option value="--">---</option>
   <!--  <option value="2036">2036</option><option value="2035">2035</option><option value="2034">2034</option><option value="2033">2033</option><option value="2032">2032</option><option value="2031">2031</option><option value="2030">2030</option><option value="2029">2029</option><option value="2028">2028</option><option value="2027">2027</option><option value="2026">2026</option><option value="2025">2025</option><option value="2024">2024</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option>
   <!--  </select>  -->
     <input type="text" name="geburtsdatum" id="datepickergd" style="width:250px">
     <div style="display:none">
     
     </div>
             
    </div>
    
    
    <div class="formular_fehler" id="fehler_geburtsdatum" style="display:none">
     Gültiges Datum; Mindestens 18 Jahre alt.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td><input type="hidden" id="must_geburtsort" name="must_geburtsort" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_geburtsort" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="100" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Geburtsort</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="geburtsort" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_geburtsort">
    </div>
    
    
    <div class="formular_fehler" id="fehler_geburtsort" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_kennwort" name="must_kennwort" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_kennwort" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Kundenkennwort</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="kennwort" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_kennwort">
    </div>
    
    
    <div class="formular_fehler" id="fehler_kennwort" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr><tr>
    <td colspan="2"><div grid-row--base=""><div class="kundenkennwort_angabe grid-col--full grid-col--base">Dieses Kennwort benötigen Sie, um sich beim Netzbetreiber telefonisch bei Fragen und Problemen Unterstützung zu erhalten</div></div></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"> <div class="formular_end"></div><h1 style="margin-bottom:1px">II. Legitimation und Ausweisdaten</h1><div class="formular_start"></div><div class="formular_body clearfix"></td>
  </tr>
  
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_staat" name="must_staat" value="9">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_staat" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Staatsangehörigkeit</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    <script>function staat_select() 
    {
      if(document.vertragseingabe.staat.value==1){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==1){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==2){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==2){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==3){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==3){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==4){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==4){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==5){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==5){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==6){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==6){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==7){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==7){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==8){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==8){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==9){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==9){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==10){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==10){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==11){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==11){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==12){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==12){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==14){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==14){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==15){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==15){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==16){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==16){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==17){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==17){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==18){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==18){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==19){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==19){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==20){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==20){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==21){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==21){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==22){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==22){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==23){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==23){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==24){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==24){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==25){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==25){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==26){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==26){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==27){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==27){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==28){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==28){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==29){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==29){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==30){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==30){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==31){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==31){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==32){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==32){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==33){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==33){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==34){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==34){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==35){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==35){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==36){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==36){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==37){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==37){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==38){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==38){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==39){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==39){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==40){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==40){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==41){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==41){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==42){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==42){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==43){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==43){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==44){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==44){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==45){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==45){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==46){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==46){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==47){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==47){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==48){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==48){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==49){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==49){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==50){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==50){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==51){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==51){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==52){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==52){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==53){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==53){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==54){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==54){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==55){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==55){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==56){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==56){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==57){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==57){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==58){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==58){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==59){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==59){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==60){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==60){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==61){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==61){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==62){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==62){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==63){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==63){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==64){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==64){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==65){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==65){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==66){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==66){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==67){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==67){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==68){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==68){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==69){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==69){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==70){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==70){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==71){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==71){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==72){document.getElementById('formreihe_aufenthaltsnr').style.display='block'}
          if(document.vertragseingabe.staat.value==72){document.getElementById('formreihe_aufenthaltsart').style.display='block'}
          if(document.vertragseingabe.staat.value==13){document.getElementById('formreihe_aufenthaltsnr').style.display='none'}
          if(document.vertragseingabe.staat.value==13){document.getElementById('formreihe_aufenthaltsart').style.display='none'}
          
    }
    </script>
    <div class="formular_abfrage"> 
    <select onchange="staat_select()" name="staat" class="new_input_select" style="width:350px" maxlength="100" id="form_staat">
    <option value="1">Albanien</option><option value="2">Algerien</option><option value="3">Argentinien</option><option value="4">Aserbaidschan</option><option value="5">Australien</option><option value="6">Belarus</option><option value="7">Belgien</option><option value="8">Bosnien-Herzegowina</option><option value="9">Brasilien</option><option value="10">Bulgarien</option><option value="11">China</option><option value="12">Dänemark</option><option value="13" selected="">Deutschland</option><option value="14">Estland</option><option value="15">Finnland</option><option value="16">Frankreich</option><option value="17">Georgien</option><option value="18">Griechenland</option><option value="19">Großbritannien</option><option value="20">Indien</option><option value="21">Irak</option><option value="22">Iran</option><option value="23">Irland</option><option value="24">Island</option><option value="25">Israel</option><option value="26">Italien</option><option value="27">Japan</option><option value="28">Jugoslawien</option><option value="29">Kanada</option><option value="30">Kasachstan</option><option value="31">Kirgisistan</option><option value="32">Korea (Süd)</option><option value="33">Kroatien</option><option value="34">Lettland</option><option value="35">Liechtenstein</option><option value="36">Litauen</option><option value="37">Luxemburg</option><option value="38">Malta</option><option value="39">Marokko</option><option value="40">Mazedonien</option><option value="41">Mexiko</option><option value="42">Monaco</option><option value="43">Neuseeland</option><option value="44">Niederlande</option><option value="45">Norwegen</option><option value="46">Österreich</option><option value="47">Pakistan</option><option value="48">Polen</option><option value="49">Portugal</option><option value="50">Rumänien</option><option value="51">Russische Föderation</option><option value="52">Saudi Arabien</option><option value="53">Schweden</option><option value="54">Schweiz</option><option value="55">Slowakische Republik</option><option value="56">Slowenien</option><option value="57">Sonstige</option><option value="58">Spanien</option><option value="59">Südafrika</option><option value="60">Taiwan</option><option value="61">Thailand</option><option value="62">Tschechische Republik</option><option value="63">Tunesien</option><option value="64">Türkei</option><option value="65">Ukraine</option><option value="66">Ungarn</option><option value="67">USA</option><option value="68">Usbekistan</option><option value="69">Zypern</option><option value="70">Äthiopien</option><option value="71">Seribien</option><option value="72">Indonesien</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_staat" style="display:none">
     Passt nicht zur Ausweisart.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_ausweisart" name="must_ausweisart" value="0">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ausweisart" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="100" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Ausweisart</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">&nbsp;</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    <script>function ausweisart_select() 
    {
      if(document.vertragseingabe.ausweisart.value==0){document.getElementById('formreihe_personalausweis_0').style.display='block'}
          if(document.vertragseingabe.ausweisart.value==1){document.getElementById('formreihe_reisepass_0').style.display='block'}
          if(document.vertragseingabe.ausweisart.value==2){document.getElementById('formreihe_ausweisnr').style.display='block'}
          if(document.vertragseingabe.ausweisart.value==0){document.getElementById('formreihe_reisepass_0').style.display='none'}
          if(document.vertragseingabe.ausweisart.value==0){document.getElementById('formreihe_ausweisnr').style.display='none'}
          if(document.vertragseingabe.ausweisart.value==1){document.getElementById('formreihe_personalausweis_0').style.display='none'}
          if(document.vertragseingabe.ausweisart.value==1){document.getElementById('formreihe_ausweisnr').style.display='none'}
          if(document.vertragseingabe.ausweisart.value==2){document.getElementById('formreihe_reisepass_0').style.display='none'}
          if(document.vertragseingabe.ausweisart.value==2){document.getElementById('formreihe_personalausweis_0').style.display='none'}
          
    }
    </script>
    <div class="formular_abfrage"> 
    <select onchange="ausweisart_select()" name="ausweisart" class="new_input_select" style="width:350px" maxlength="100" id="form_ausweisart">
    <option value="0" selected="">Deutscher Personalausweis</option><option value="1">Deutscher Reisepass</option><option value="2">Ausländischer Reisepass</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_ausweisart" style="display:none">
     Passt nicht zur Ausweisart.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_personalausweis_0" name="must_personalausweis_0" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_personalausweis_0" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Personalausweisnr.</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="150" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="personalausweis_0" value="" style="width:350px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_personalausweis_0">
    </div>
    <div class="personalausweis"><img src="./image/perso.jpg" alt="x7"></div>
    
    <div class="formular_fehler" id="fehler_personalausweis_0" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <input type="hidden" id="must_ausweisnr" name="must_ausweisnr" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ausweisnr" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Ausweisnr.</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="ausweisnr" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_ausweisnr">
    </div>
    
    
    <div class="formular_fehler" id="fehler_ausweisnr" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    
    
    <td> <input type="hidden" id="must_gueltigkeit" name="must_gueltigkeit" value="8">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_gueltigkeit" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Ausweis Gültigkeit</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
     
    <!-- <select id="d_gueltigkeit" name="d_gueltigkeit">
   <!--  <option value="--">---</option> 
   <!--  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
     </select> 

     <select id="m_gueltigkeit" name="m_gueltigkeit">
     <option value="--">---</option>
   <!--  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
     </select>

     <select id="y_gueltigkeit" name="y_gueltigkeit">
     <option value="--">---</option>
   <!--  <option value="2036">2036</option><option value="2035">2035</option><option value="2034">2034</option><option value="2033">2033</option><option value="2032">2032</option><option value="2031">2031</option><option value="2030">2030</option><option value="2029">2029</option><option value="2028">2028</option><option value="2027">2027</option><option value="2026">2026</option><option value="2025">2025</option><option value="2024">2024</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option>
     </select> -->
     <input type="text" name="gueltigkeit" id="datepickerag" style="width:250px">
     <div style="display:none">
     <input type="text" name="gueltigkeit" id="form_gueltigkeit" value="">
     </div>
             
    </div>
    
    
    <div class="formular_fehler" id="fehler_gueltigkeit" style="display:none">
     Das Datum muss in der Zukunft liegen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_ausstellungsort" name="must_ausstellungsort" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ausstellungsort" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Ausstellungsort</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="150" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="ausstellungsort" value="" style="width:350px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_ausstellungsort">
    </div>
    
    
    <div class="formular_fehler" id="fehler_ausstellungsort" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_ausstellungsdatum" name="must_ausstellungsdatum" value="7">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ausstellungsdatum" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Ausstellungsdatum</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
     
    <!-- <select id="d_ausstellungsdatum" name="d_ausstellungsdatum">
    <!-- <option value="--">---</option>
    <!-- <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
     </select>

     <select id="m_ausstellungsdatum" name="m_ausstellungsdatum">
     <option value="--">---</option>
    <!-- <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
     </select>

     <select id="y_ausstellungsdatum" name="y_ausstellungsdatum">
     <option value="--">---</option>
    <!-- <option value="2036">2036</option><option value="2035">2035</option><option value="2034">2034</option><option value="2033">2033</option><option value="2032">2032</option><option value="2031">2031</option><option value="2030">2030</option><option value="2029">2029</option><option value="2028">2028</option><option value="2027">2027</option><option value="2026">2026</option><option value="2025">2025</option><option value="2024">2024</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option>
     </select>  -->
     <input type="date" name="ausstellungsdatum">
     <div style="display:none">
     
     </div>
             
    </div>
    
    
    <div class="formular_fehler" id="fehler_ausstellungsdatum" style="display:none">
     Das Datum muss in der Vergangenheit liegen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_reisepass_0" name="must_reisepass_0" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_reisepass_0" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Reisepasssnr.</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="reisepass_0" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_reisepass_0">
    </div>
    <div class="personalausweis"><img src="./image/reisepass.jpg" alt="x7"></div>
    
    <div class="formular_fehler" id="fehler_reisepass_0" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td><input type="hidden" id="must_aufenthaltsart" name="must_aufenthaltsart" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_aufenthaltsart" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Aufenthaltsart</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    <script>function aufenthaltsart_select() 
    {
      if(document.vertragseingabe.aufenthaltsart.value==1){document.getElementById('formreihe_aufenthalt_bis').style.display='block'}
          if(document.vertragseingabe.aufenthaltsart.value==0){document.getElementById('formreihe_aufenthalt_bis').style.display='none'}
          
    }
    </script>
    <div class="formular_abfrage"> 
    <select onchange="aufenthaltsart_select()" name="aufenthaltsart" class="new_input_select" style="width:180px" maxlength="100" id="form_aufenthaltsart">
    <option value="0" selected="">Unbefristeter Aufenthalt</option><option value="1">Befristeter Aufenthalt</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_aufenthaltsart" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_aufenthaltsnr" name="must_aufenthaltsnr" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_aufenthaltsnr" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Aufenthaltsnr.</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="aufenthaltsnr" value="" style="width:180px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_aufenthaltsnr">
    </div>
    
    
    <div class="formular_fehler" id="fehler_aufenthaltsnr" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td><input type="hidden" id="must_aufenthalt_bis" name="must_aufenthalt_bis" value="10">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_aufenthalt_bis" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Aufenthalt bis</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
     
     <select id="d_aufenthalt_bis" name="d_aufenthalt_bis">
     <option value="--">---</option>
     <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
     </select>

     <select id="m_aufenthalt_bis" name="m_aufenthalt_bis">
     <option value="--">---</option>
     <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
     </select>

     <select id="y_aufenthalt_bis" name="y_aufenthalt_bis">
     <option value="--">---</option>
     <option value="2036">2036</option><option value="2035">2035</option><option value="2034">2034</option><option value="2033">2033</option><option value="2032">2032</option><option value="2031">2031</option><option value="2030">2030</option><option value="2029">2029</option><option value="2028">2028</option><option value="2027">2027</option><option value="2026">2026</option><option value="2025">2025</option><option value="2024">2024</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option>
     </select>
     
     <div style="display:none">
     <input type="text" name="aufenthalt_bis" id="form_aufenthalt_bis" value="">
     </div>
             
    </div>
    
    
    <div class="formular_fehler" id="fehler_aufenthalt_bis" style="display:none">
     Gültiges Datum; Mindestens 1 Jahr in der Zukunft.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div class="formular_end"></div><h1 style="margin-bottom:1px">III. Bankdaten</h1><div class="formular_start"></div><div class="formular_body clearfix"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_kreditinstitut" name="must_kreditinstitut" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_kreditinstitut" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Kreditinstitut</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="kreditinstitut" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_kreditinstitut">
    </div>
    
    
    <div class="formular_fehler" id="fehler_kreditinstitut" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_konto" name="must_konto" value="4">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_konto" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Kontonummer</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="konto" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_konto">
    </div>
    
    
    <div class="formular_fehler" id="fehler_konto" style="display:none">
     Muss eine mind. 3-stellige Zahl sein.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_blz" name="must_blz" value="3">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_blz" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Bankleitzahl</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td width="250" class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="blz" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_blz">
    </div>
    
    
    <div class="formular_fehler" id="fehler_blz" style="display:none">
     Muss eine 8-stellige Zahl sein.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div grid-row--base=""><div class="kundenkennwort_angabe grid-col--full grid-col--base">Bitte füllen Sie entweder die Felder <span style="color:#d00">Bankleitzahl/Kontonummer</span> aus oder die Felder <span style="color:#d00">IBAN/BIC</span>.</div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_iban" name="must_iban" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_iban" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">IBAN</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="iban" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_iban">
    </div>
    
    
    <div class="formular_fehler" id="fehler_iban" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_bic" name="must_bic" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_bic" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">BIC</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="bic" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_bic">
    </div>
    
    
    <div class="formular_fehler" id="fehler_bic" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_ec_kartennr" name="must_ec_kartennr" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ec_kartennr" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">EC-Kartennummer</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="ec_kartennr" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_ec_kartennr">
    </div>
    
    
    <div class="formular_fehler" id="fehler_ec_kartennr" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_ec_gueltigkeit" name="must_ec_gueltigkeit" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ec_gueltigkeit" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Gültigkeit</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="ec_gueltigkeit" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_ec_gueltigkeit">
    </div>
    
    
    <div class="formular_fehler" id="fehler_ec_gueltigkeit" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div class="formular_end"></div><h1 style="margin-bottom:1px">IV. Optionen für den Mobilfunkvertrag</h1><div class="formular_start"></div><div class="formular_body clearfix"></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_simcard_typ" name="must_simcard_typ" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_simcard_typ" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">SIM-Karte</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
    <select name="simcard_typ" class="new_input_select" style="width:400px" maxlength="100" id="form_simcard_typ">
    <option value="0" selected="">Zum Gerät passende SIM-Karte</option><option value="1">Standard SIM-Karte</option><option value="2">Micro SIM-Karte</option><option value="3">Nano SIM-Karte</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_simcard_typ" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_mnp" name="must_mnp" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_mnp" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Rufnummernmitnahme</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    <script>function mnp_select() 
    {
      if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_alte_nummer').style.display='block'}
          if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_ehem_anbieter').style.display='block'}
          if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_ehem_vertragstyp').style.display='block'}
          if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_kuendigungsdatum').style.display='block'}
          if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_mnp_kundennr').style.display='block'}
          if(document.vertragseingabe.mnp.value==1){document.getElementById('formreihe_mnp_info').style.display='block'}
          if(document.vertragseingabe.mnp.value==2){document.getElementById('formreihe_alte_nummer').style.display='block'}
          if(document.vertragseingabe.mnp.value==2){document.getElementById('formreihe_ehem_anbieter').style.display='block'}
          if(document.vertragseingabe.mnp.value==2){document.getElementById('formreihe_ehem_vertragstyp').style.display='block'}
          if(document.vertragseingabe.mnp.value==2){document.getElementById('formreihe_mnp_info').style.display='block'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_alte_nummer').style.display='none'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_ehem_anbieter').style.display='none'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_ehem_vertragstyp').style.display='none'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_kuendigungsdatum').style.display='none'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_mnp_kundennr').style.display='none'}
          if(document.vertragseingabe.mnp.value==0){document.getElementById('formreihe_mnp_info').style.display='none'}
          if(document.vertragseingabe.mnp.value==2){document.getElementById('formreihe_kuendigungsdatum').style.display='none'}
          
    }
    </script>
    <div class="formular_abfrage"> 
    <select onchange="mnp_select()" name="mnp" class="new_input_select" style="width:400px" maxlength="100" id="form_mnp">
    <option value="0" selected="">Ich möchte keine Rufnummer mitnehmen</option><option value="1">Ich möchte meine bisherige Rufnummer mitnehmen</option><option value="2">Ich möchte meine bisherige Rufnummer ab sofort mitnehmen</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_mnp" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_telefonbuch" name="must_telefonbuch" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_telefonbuch" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Telefonbucheintrag</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
    <select name="telefonbuch" class="new_input_select" style="width:400px" maxlength="100" id="form_telefonbuch">
    <option value="0" selected="">Kein Eintrag und keine Auskunft</option><option value="1">Eintrag und Auskunft</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_telefonbuch" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td> <input type="hidden" id="must_ezv" name="must_ezv" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ezv" style="display:block">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Verbindungsnachweis</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
    <select name="ezv" class="new_input_select" style="width:400px" maxlength="100" id="form_ezv">
    <option value="0" selected="">Kostenlos Einzelverbindungsnachweis erwünscht</option><option value="1">Kostenlos und verkürzter Einzelverbindungsnachweis erwünscht</option><option value="2">Kostenpflichter Komfort-Nachweis erwünscht</option><option value="3">Kein Einzelverbindungsnachweis erwünscht</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_ezv" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_alte_nummer" name="must_alte_nummer" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_alte_nummer" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Rufnummer</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="alte_nummer" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_alte_nummer">
    </div>
    
    
    <div class="formular_fehler" id="fehler_alte_nummer" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table></td>
    <td><input type="hidden" id="must_ehem_anbieter" name="must_ehem_anbieter" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ehem_anbieter" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Bisheriger Anbieter</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="ehem_anbieter" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_ehem_anbieter">
    </div>
    
    
    <div class="formular_fehler" id="fehler_ehem_anbieter" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><input type="hidden" id="must_ehem_vertragstyp" name="must_ehem_vertragstyp" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_ehem_vertragstyp" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Bisheriger Vertragstyp</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage"> 
    <select name="ehem_vertragstyp" class="new_input_select" style="width:250px" maxlength="100" id="form_ehem_vertragstyp">
    <option value="0" selected="">Laufzeitvertrag</option><option value="1">Prepaid Karte</option> 
    </select>
    </div>
    
    
    <div class="formular_fehler" id="fehler_ehem_vertragstyp" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
    </td>
    <td> <input type="hidden" id="must_kuendigungsdatum" name="must_kuendigungsdatum" value="1">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_kuendigungsdatum" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Kündigungsdatum</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">*</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="kuendigungsdatum" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_kuendigungsdatum">
    </div>
    
    
    <div class="formular_fehler" id="fehler_kuendigungsdatum" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
   </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td> <input type="hidden" id="must_mnp_kundennr" name="must_mnp_kundennr" value="0">
    <table class="formreihe_table grid-col--half grid-col--base grid-col--left" id="formreihe_mnp_kundennr" style="display:none">
    <tbody><tr class="formular_field_box">
    
    <td width="150" class="formular_field">
    <div class="formular_fieldname">
     <span class="">Dortige Kundennr.</span>
     
    </div>
    </td>
    <td class="grid-col--left" valign="top" width="10" style="padding-top:6px">
     <span style="font-weight:normal;color:#dd0000;">&nbsp</span>
    </td>
    
    <td class="formular_abfrage_input">
    
    <div class="formular_abfrage">
    <input type="text" name="alt_kdnr" value="" style="width:250px" maxlength="100" class="new_input" onfocus="this.className=&#39;new_input_active&#39;;" onblur="this.className=&#39;new_input&#39;" id="form_mnp_kundennr">
    </div>
    
    
    <div class="formular_fehler" id="fehler_mnp_kundennr" style="display:none">
     Bitte ausfüllen.
    </div>
    
    </td>
    </tr>
    </tbody></table>
   </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    
  </tr>
  <tr>
    <td colspan="2"> <div style="font-size:13px;color:#d00;font-weight:bold;padding:5px;display:none" id="formreihe_mnp_info">Bitte beachten Sie das eine Verzichtserklärung bzw. ohne Kündigungsbestätigung Ihr Auftrag nicht durchgeführt werden kann.<br>
<br>
Hier werden Ihnen in der Regel je nach Anbieter 25-30€ in Rechnung gestellt bzw. von Ihrem Guthaben abgebucht, für nähere informationen rufen Sie bitte einfach an Tel.: 07255 - 768 40 44.
</div></td>
  </tr>
</table>
<p>&nbsp;</p>
  <div class="formular_end"></div>
  
<div class="next-step">
<!--<div class="grid-col--half grey-btn grid-col--base grid-col--left">
  
 <!--   <input type="button" value="« Schritt zurück" class="bigsubmit" onclick="window.location.href=&#39;warenkorb.html&#39;">
   
     </div>

<div class="grid-col--half grid-col--base grid-col--left">
  <!--  <input type="button" class="bigsubmit" value="Nächster Schritt »" onclick="ibancheck();checkAndSubmitJS(&#39;vertragseingabe&#39;)">
   
   </div>  -->
</div></form>
 <div class="buttons">
  <div class="pull-right">
    <button type="button" id="button-vertragsdaten" data-loading-text="<?php echo $text_loading; ?>" class="button"><span><span><?php echo $button_continue; ?></span></span></button>
  </div>
</div>