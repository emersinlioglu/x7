<?php
class ControllerCheckoutSuccess extends Controller {

	public function mailpdf() {

		// Include pdftk-php class
		require('./pdftk-php.php');

		// Initiate the class
		$pdfmaker = new pdftk_php;

		$data = $this->session->data['vertragsdaten'];

//ini_set("log_errors", 1);
//ini_set("error_log", "/tmp/php-error.log");
//error_log('=============== test error log ==================');
//error_log(print_r($data, 1));

		$pdf_herr 	=isset($data['herr']) ? $data['herr'] : '';
		$pdf_frau = isset($data['frau']) ? $data['frau'] : '';
		$pdf_firma =isset($data['firma']) ? $data['firma'] : '';
		$pdf_mobkunde_ja = isset($data['mobkunde_ja']) ? $data['mobkunde_ja'] : '';
		$pdf_mobkunde_nein =isset($data['mobkunde_nein']) ? $data['mobkunde_nein'] : '';

		$pdf_geburtsort =isset($data['geburtsort']) ? $data['geburtsort'] : '';
		$pdf_vorname= isset($data['vorname']) ? $data['vorname'] : 'test';
		$pdf_name = isset($data['name']) ? $data['name'] : 'test';
		$pdf_strasse = isset($data['strasse']) ? $data['strasse'] : 'test';
		$pdf_hausnr = isset($data['hausnr']) ? $data['hausnr'] : 'test';
		$pdf_plz = isset($data['plz']) ? $data['plz'] : 'test';
		$pdf_ort = isset($data['ort']) ? $data['ort'] : 'test';
		$pdf_email = isset($data['email']) ? $data['email'] : 'test';
		$pdf_rufnummer = isset($data['rufnummer']) ? $data['rufnummer'] : 'test';
		$pdf_geburtsdatum = isset($data['geburtsdatum']) ? $data['geburtsdatum'] : '';
		$pdf_kennwort = isset($data['kennwort']) ? $data['kennwort'] : '';
		$pdf_staat = isset($data['staat']) ? $data['staat'] : '';
		$pdf_ausweisart = isset($data['ausweisart']) ? $data['ausweisart'] : '';
		$pdf_personalausweis_0 = isset($data['personalausweis_0']) ? $data['personalausweis_0'] : '';
		$pdf_reisepass_0 = isset($data['reisepass_0']) ? $data['reisepass_0'] : '';
		$pdf_ausweissnr = isset($data['ausweissnr']) ? $data['ausweissnr'] : '';
		$pdf_ausweisgultig = isset($data['ausweisgultig']) ? $data['ausweisgultig'] : '';
		$pdf_ausstellungsort = isset($data['ausstellungsort']) ? $data['ausstellungsort'] : '';
		$pdf_ausstellungsdatum = isset($data['ausstellungsdatum']) ? $data['ausstellungsdatum'] : '';
		$pdf_aufenthaltsart = isset($data['aufenthaltsart']) ? $data['aufenthaltsart'] : '';
		$pdf_aufenthaltsnr = isset($data['aufenthaltsnr']) ? $data['aufenthaltsnr'] : '';
		$pdf_kreditinstitut = isset($data['kreditinstitut']) ? $data['kreditinstitut'] : '';

		$pdf_blz = isset($data['blz']) ? $data['blz'] : '';
		$pdf_konto = isset($data['konto']) ? $data['konto'] : '';
		$pdf_iban = isset($data['iban']) ? $data['iban'] : '';
		$pdf_bic = isset($data['bic']) ? $data['bic'] : '';
		$pdf_ec_kartennr = isset($data['ec_kartennr']) ? $data['ec_kartennr'] : '';
		$pdf_ec_gueltigkeit = isset($data['ec_gueltigkeit']) ? $data['ec_gueltigkeit'] : '';

		$pdf_simcard_typ = isset($data['simcard_typ']) ? $data['simcard_typ'] : '';
		$pdf_mnp = isset($data['mnp']) ? $data['mnp'] : '';
		$pdf_alte_nummer = isset($data['alte_nummer']) ? $data['alte_nummer'] : '';
		$pdf_alt_kdnr = isset($data['alt_kdnr']) ? $data['alt_kdnr'] : '';
		$pdf_ehem_anbieter = isset($data['alt_anbieter']) ? $data['alt_anbieter'] : 'test';
		$pdf_ehem_vertragstyp = isset($data['ehem_vertragstyp']) ? $data['ehem_vertragstyp'] : '';
		$pdf_kuendigungsdatum = isset($data['kuendigungsdatum']) ? $data['kuendigungsdatum'] : '';
		$pdf_telefonbuch = isset($data['telefonbuch']) ? $data['telefonbuch'] : '';
		$pdf_ezv = isset($data['ezv']) ? $data['ezv'] : '';

		//ek pdf formular felder
		//ayyildiz ve mobilcom debitel anrede checkbox
		$pdf_frau_check =  '';
		$pdf_herr_check = '';
		$pdf_firma_check = '';
		//ayyildiz vatandaslik checkbox
		$pdf_staats_deutsch =  '';
		$pdf_staats_turk = '';
		$pdf_staats_eu = '';
		$pdf_staats_rest = '';
		//ayyildiz pass sekil checkbox
		$pdf_ausweis_perso = '';
		$pdf_ausweis_pass = '';
		// ayyildiz und Mobilcom Debitel EVN Checkbox
		$pdf_ezv_kurz = '';
		$pdf_ezv_keine = '';
		$pdf_ezv_lang = '';
		$pdf_ezv_ja = '';

		//mobilcom debitel Textfeld
		$pdf_perso_gultig = '';
		$pdf_pass_gultig = '';
		$pdf_auswiesno = '';
		$pdf_kontoinh = '';

		//Mobilcom telefonbucheintrag checkbox
		$pdf_telefonbuch_ja = '';
		$pdf_telefonbuch_nein = '';

		$pdf_staat = $this->convertStaatIdToName($pdf_staat);

		$strasse = $pdf_strasse;
		if (isset($_GET['vertragstyp'])) {
			switch ($_GET['vertragstyp']) {
				case 'vodafone': 									break;
				case 'o2': 											break;
				case 'mobilcom': $strasse = ' ' . $pdf_hausnr;   	break;  // nur für mobilcom
				default: break;
			}
		}

		$pdf_datum = '';
		$pdf_datum2 = '';
		$pdf_datum3 = '';

		// $fdf_data_strings associates the names of the PDF form fields to the PHP variables you just set above. In order to work correctly the PDF form field name has to be exact. PDFs made in Acrobat generally have simpler names - just the name you assigned to the field. PDFs made in LiveCycle Designer nest their forms in other random page elements, creating a long and hairy field name. You can use pdftk to discover the real names of your PDF form fields: run "pdftk form.pdf dump_data_fields > form-fields.txt" to generate a report.

		// Example of field names from a PDF created in LiveCycle:
		// $fdf_data_strings= array('form1[0].#subform[0].#area[0].LastName[0]' => $pdf_lastname,  'form1[0].#subform[0].#area[0].FirstName[0]' => $pdf_firstname, 'form1[0].#subform[0].#area[0].EMail[0]' => $pdf_email, );
		$fdf_data_strings= array(
			'frm_geburtsort'	=> $pdf_geburtsort,
			'frm_name' 			=> $pdf_name,
			'frm_vorname' 		=> $pdf_vorname,
			'str_hausnr'		=> $strasse,
			'frm_strasse' 		=> $pdf_strasse,
			'frm_hno' 			=> $pdf_hausnr,
			'frm_plz' 			=> $pdf_plz,
			'frm_ort' 			=> $pdf_ort,
			'frm_gb_datum'	 	=> $pdf_geburtsdatum,
			'name_des_ver' 		=> $pdf_vorname.$pdf_name,
			'frm_email'			=> $pdf_email,
			'frm_telefon'		=> $pdf_rufnummer,
			'frm_kennwort'		=> $pdf_kennwort,
			'frm_staats'		=> $pdf_staat,
			'frm_persono'		=> $pdf_personalausweis_0,
			'frm_passno'		=> $pdf_reisepass_0,
			'frm_bank'			=> $pdf_kreditinstitut,
			'frm_blz'			=> $pdf_blz,
			'frm_konto'			=> $pdf_konto,
			'frm_ecno'			=> $pdf_ec_kartennr,
			'frm_ec_gultig'		=> $pdf_ec_gueltigkeit,
			'frm_iban'			=> $pdf_iban,
			'frm_alt_anbieter'	=> $pdf_ehem_anbieter,
			'frm_bic'			=> $pdf_bic,
			'frm_datum'			=> $pdf_datum,
			'frm_datum2'		=> $pdf_datum2,
			'datum'				=> $pdf_datum3,
		);

		// See the documentation of pdftk-php.php for more explanation of these other variables.

		// Used for radio buttons and check boxes
		// Example: (For check boxes options are Yes and Off)
		// $pdf_checkbox1 = "Yes";
		// $pdf_checkbox2 = "Off";
		// $pdf_checkbox3 = "Yes";
		// $fdf_data_names = array('checkbox1' => $pdf_checkbox1,'checkbox2' => $pdf_checkbox2,'checkbox3' => $pdf_checkbox3,'checkbox4' => $pdf_checkbox4);
		//$fdf_data_names = array('herr'=>$pdf_herr, 'frau'=>$pdf_frau, 'firma'=>$pdf_firma,'mobkunde_nein'=>$pdf_mobkunde_nein, 'mobkunde_ja'=>$pdf_mobkunde_ja, ); // Leave empty if there are no radio buttons or check boxes
		$fdf_data_names = array();
		$fields_hidden = array(); // Used to hide form fields

		$fields_readonly = array(); // Used to make fields read only - however, flattening the output with pdftk will in effect make every field read only. If you don't want a flattened pdf and still want some read only fields, use this variable and remove the flatten flag near line 70 in pdftk-php.php

		// Take each REQUEST value and clean it up for fdf creation
		foreach( $_REQUEST as $key => $value ) {
			// Translate tildes back to periods
			$fdf_data_strings[strtr($key, '~', '.')]= $value;
		}

		// Name of file to be downloaded
		//$pdf_filename = "Mobilcom Vertrag für $pdf_name , $pdf_vorname.pdf";
		$pdf_filename = "O2_Vertrag für Anrede $pdf_name, $pdf_vorname.pdf";

		// Name/location of original, empty PDF form

//		if (isset($_GET['vertragstyp'])) {
//
//			switch ($_GET['vertragstyp']) {
//				case 'vodafone':
//					$pdf_original = "vodafone_mobileconnect_form.pdf";
//					break;
//				case 'o2':
//					$pdf_original = "o2_vertrag_form.pdf";
//					break;
//				case 'mobilcom':
//					$pdf_original = "mobilcomdebitel_form2.pdf";
//					break;
//				default:
//					$pdf_original = "otelo_form.pdf";
//					break;
//			}
//		}

		// Finally make the actual PDF file!
		ob_start();
		$pdfmaker->echo_pdf($fdf_data_strings, $fdf_data_names, $fields_hidden, $fields_readonly, $pdf_original, $pdf_filename);
//		$binaryPdf = ob_get_clean();
		$binaryPdf = ob_get_contents();
		ob_end_clean();

//		header("Content-Type: application/force-download");
//		header("Content-Disposition: attachment; filename=\"$pdf_filename\"");
//		echo $binaryPdf;

//		$file = 'testbinary.pdf';
//		file_put_contents($file, $binaryPdf);


		// email
		$html = '
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>My Title</title>
</head>

<body>

<h1>Verträge</h1>
<p>anbei finden Sie die abgeschlossenen Verträge in Pdf-Format.</p>

</body>
</html>
		';

		$text = 'Verträge' . PHP_EOL ;
		$text .= 'anbei finden Sie die abgeschlossenen Verträge in Pdf-Format.';


        $vertragsarten = array();
        if (isset($this->session->data['vertragsarten']) && is_array($this->session->data['vertragsarten'])) {
            $vertragsarten = $this->session->data['vertragsarten'];
        }

        if (count($vertragsarten) == 0) {
            return;
        }

        foreach($vertragsarten as $vertragsart => $isAktiv) {
            if (!$isAktiv) { continue; }

            switch ($vertragsart) {
                case 'vodafone':
                    $pdf_original = "vodafone_mobileconnect_form.pdf";
                    break;
                case 'o2':
                    $pdf_original = "o2_vertrag_form.pdf";
                    break;
                case 'mobilcom':
                    $pdf_original = "mobilcomdebitel_form2.pdf";
                    break;
                default:
                    $pdf_original = "otelo_form.pdf";
                    break;
            }
        }

		// write pdf in temp
		$fdf_fn = tempnam("pdfs", "fdf") . '.pdf';
		$fp = fopen($fdf_fn, 'w');
		if ($fp) {
			fwrite($fp, $binaryPdf);
			fclose($fp);
            chmod($fdf_fn, 0777);
		}

//		ini_set("log_errors", 1);
//		ini_set("error_log", "/tmp/php-error.log");
//		error_log($fdf_fn);

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo('erdal.mersinlioglu@hotmail.com');
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode('X7 Shop Verträge', ENT_QUOTES, 'UTF-8'));
		$mail->setSubject(html_entity_decode('X7 Shop Pdfs', ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($html);
		$mail->setText($text);
		$mail->addAttachment($fdf_fn);
		$mail->send();

        unlink($fdf_fn);
	}

	public function convertStaatIdToName($pdf_staat) {

		switch ($pdf_staat) {
			case '1': $pdf_staat = "Albanien"; break;
			case '2': $pdf_staat = "Algerien"; break;
			case '3': $pdf_staat = "Argentinien"; break;
			case '4': $pdf_staat = "Aserbaidschan"; break;
			case '5': $pdf_staat = "Australien"; break;
			case '6': $pdf_staat = "Belarus"; break;
			case '7': $pdf_staat = "Belgien"; break;
			case '8': $pdf_staat = "Bosnien-Herzegowina"; break;
			case '9': $pdf_staat = "Brasilien"; break;
			case '10': $pdf_staat = "Bulgarien"; break;
			case '11': $pdf_staat = "China"; break;
			case '12': $pdf_staat = "Dänemark"; break;
			case '13': $pdf_staat = "Deutschland"; break;
			case '14': $pdf_staat = "Estland"; break;
			case '15': $pdf_staat = "Finnland"; break;
			case '16': $pdf_staat = "Frankreich"; break;
			case '17': $pdf_staat = "Georgien"; break;
			case '18': $pdf_staat = "Griechenland"; break;
			case '19': $pdf_staat = "Großbritannien"; break;
			case '20': $pdf_staat = "Indien"; break;
			case '21': $pdf_staat = "Irak"; break;
			case '22': $pdf_staat = "Iran"; break;
			case '23': $pdf_staat = "Irland"; break;
			case '24': $pdf_staat = "Island"; break;
			case '25': $pdf_staat = "Israel"; break;
			case '26': $pdf_staat = "Italien"; break;
			case '27': $pdf_staat = "Japan"; break;
			case '28': $pdf_staat = "Jugoslawien"; break;
			case '29': $pdf_staat = "Kanada"; break;
			case '30': $pdf_staat = "Kasachstan"; break;
			case '31': $pdf_staat = "Kirgisistan"; break;
			case '32': $pdf_staat = "Korea (Süd)"; break;
			case '33': $pdf_staat = "Kroatien"; break;
			case '34': $pdf_staat = "Lettland"; break;
			case '35': $pdf_staat = "Liechtenstein"; break;
			case '36': $pdf_staat = "Litauen"; break;
			case '37': $pdf_staat = "Luxemburg"; break;
			case '38': $pdf_staat = "Malta"; break;
			case '39': $pdf_staat = "Marokko"; break;
			case '40': $pdf_staat = "Mazedonien"; break;
			case '41': $pdf_staat = "Mexiko"; break;
			case '42': $pdf_staat = "Monaco"; break;
			case '43': $pdf_staat = "Neuseeland"; break;
			case '44': $pdf_staat = "Niederlande"; break;
			case '45': $pdf_staat = "Norwegen"; break;
			case '46': $pdf_staat = "Österreich"; break;
			case '47': $pdf_staat = "Pakistan"; break;
			case '48': $pdf_staat = "Polen"; break;
			case '49': $pdf_staat = "Portugal"; break;
			case '50': $pdf_staat = "Rumänien"; break;
			case '51': $pdf_staat = "Russische Föderation"; break;
			case '52': $pdf_staat = "Saudi Arabien"; break;
			case '53': $pdf_staat = "Schweden"; break;
			case '54': $pdf_staat = "Schweiz"; break;
			case '55': $pdf_staat = "Slowakische Republik"; break;
			case '56': $pdf_staat = "Slowenien"; break;
			case '57': $pdf_staat = "Sonstige"; break;
			case '58': $pdf_staat = "Spanien"; break;
			case '59': $pdf_staat = "Südafrika"; break;
			case '60': $pdf_staat = "Taiwan"; break;
			case '61': $pdf_staat = "Thailand"; break;
			case '62': $pdf_staat = "Tschechische Republik"; break;
			case '63': $pdf_staat = "Tunesien"; break;
			case '64': $pdf_staat = "Tuerkei"; break;
			case '65': $pdf_staat = "Ukraine"; break;
			case '66': $pdf_staat = "Ungarn"; break;
			case '67': $pdf_staat = "USA"; break;
			case '68': $pdf_staat = "Usbekistan"; break;
			case '69': $pdf_staat = "Zypern"; break;
			case '70': $pdf_staat = "Äthiopien"; break;
			case '71': $pdf_staat = "Seribien"; break;
			case '72': $pdf_staat = "Indonesien"; break;
			default: break;
		}

		return $pdf_staat;
	}

	public function createPdf() {

		// Include pdftk-php class
		require('./pdftk-php.php');
		
		// Initiate the class
		$pdfmaker = new pdftk_php;
		
		// Define variables for all the data fields in the PDF form. You need to assign a column in the database to each field that you'll be using in the PDF. 
		// Example:
		// $pdf_column = $data['column'];
		
		// You can also format the MySQL data how you want here. One common example is formatting a date saved in the database. For example:
		// $pdf_date = date("l, F j, Y, g:i a", strtotime($data['date']));
		
		//$data = mysql_fetch_array($result);

		//$pdf_firstname = $data['firstname'];
		//$pdf_lastname = $data['lastname'];
		/*


		$pdf_datum = $pdf_datum1 =$pdf_datum2 =$pdf_datum3 =date("d.m.Y");

$pdf_check_saat = isset($data['staat']) ? $data['staat'] : '';
switch ($pdf_check_saat) {
	case 1: 
		$pdf_staat='De';
		break;
	case 2: 
		$pdf_staat='De';
		break;
}
*/

/*
		$pdf_herr 	=$this->session->data['vertragsdaten']['herr'];
		$pdf_frau =$this->session->data['vertragsdaten']['frau'];
		$pdf_firma =$this->session->data['vertragsdaten']['firma'];
		//$pdf_mobkunde_ja =$this->session->data['vertragsdaten']['mobkunde_ja'];
		//$pdf_mobkunde_nein =$this->session->data['vertragsdaten']['mobkunde_nein'];

		$pdf_vorname= $this->session->data['vertragsdaten']['vorname'];
		$pdf_name =$this->session->data['vertragsdaten']['name'];
		$pdf_strasse =$this->session->data['vertragsdaten']['strasse'];
		$pdf_hausnr =$this->session->data['vertragsdaten']['hausnr'];
		$pdf_plz =$this->session->data['vertragsdaten']['plz'];
		$pdf_ort =$this->session->data['vertragsdaten']['ort'];
		$pdf_email =$this->session->data['vertragsdaten']['email'];
		$pdf_rufnummer =$this->session->data['vertragsdaten']['rufnummer'];
		$pdf_geburtsdatum =$this->session->data['vertragsdaten']['geburtsdatum'];
		$pdf_geburtsort =$this->session->data['vertragsdaten']['geburtsort'];
		$pdf_kennwort =$this->session->data['vertragsdaten']['kennwort'];
		$pdf_staats =$this->session->data['vertragsdaten']['staats'];
		$pdf_ausweisart =$this->session->data['vertragsdaten']['ausweisart'];
		$pdf_personummer =$this->session->data['vertragsdaten']['personummer'];
		$pdf_deutschreisepassno =$this->session->data['vertragsdaten']['deutschreisepassno'];
		$pdf_auslreisepassno =$this->session->data['vertragsdaten']['auslreisepassno'];
		$pdf_ausweisgultig =$this->session->data['vertragsdaten']['ausweisgultig'];
		$pdf_ausstellungsort =$this->session->data['vertragsdaten']['ausstellungsort'];
		$pdf_ausstellungsdatum =$this->session->data['vertragsdaten']['ausstellungsdatum'];
		$pdf_aufenthaltsart =$this->session->data['vertragsdaten']['aufenthaltsart'];
		$pdf_aufenthaltsnr =$this->session->data['vertragsdaten']['aufenthaltsnr'];
		$pdf_bank =$this->session->data['vertragsdaten']['bank'];

		$pdf_blz =$this->session->data['vertragsdaten']['blz'];
		$pdf_kontonr =$this->session->data['vertragsdaten']['kontonr'];
		$pdf_iban =$this->session->data['vertragsdaten']['iban'];
		$pdf_bic =$this->session->data['vertragsdaten']['bic'];
		$pdf_ecnr =$this->session->data['vertragsdaten']['ecnr'];
		$pdf_gultig =$this->session->data['vertragsdaten']['gultig'];
		$pdf_aufenthaltsnr =$this->session->data['vertragsdaten']['sim'];
		$pdf_bank =$this->session->data['vertragsdaten']['bank'];

		*/
		
//ini_set("log_errors", 1);
//ini_set("error_log", "/tmp/php-error.log");
//error_log('=============== test error log ==================');

		$data = $this->session->data['vertragsdaten'];

//error_log(print_r($data, 1));

		$pdf_herr 	=isset($data['herr']) ? $data['herr'] : '';
		$pdf_frau = isset($data['frau']) ? $data['frau'] : '';
		$pdf_firma =isset($data['firma']) ? $data['firma'] : '';
		$pdf_mobkunde_ja = isset($data['mobkunde_ja']) ? $data['mobkunde_ja'] : '';
		$pdf_mobkunde_nein =isset($data['mobkunde_nein']) ? $data['mobkunde_nein'] : '';

		$pdf_geburtsort =isset($data['geburtsort']) ? $data['geburtsort'] : '';
		$pdf_vorname= isset($data['vorname']) ? $data['vorname'] : 'test';
		$pdf_name = isset($data['name']) ? $data['name'] : 'test';
		$pdf_strasse = isset($data['strasse']) ? $data['strasse'] : 'test';
		$pdf_hausnr = isset($data['hausnr']) ? $data['hausnr'] : 'test';
		$pdf_plz = isset($data['plz']) ? $data['plz'] : 'test';
		$pdf_ort = isset($data['ort']) ? $data['ort'] : 'test';
		$pdf_email = isset($data['email']) ? $data['email'] : 'test';
		$pdf_rufnummer = isset($data['rufnummer']) ? $data['rufnummer'] : 'test';
		$pdf_geburtsdatum = isset($data['geburtsdatum']) ? $data['geburtsdatum'] : '';
		$pdf_kennwort = isset($data['kennwort']) ? $data['kennwort'] : '';
		$pdf_staat = isset($data['staat']) ? $data['staat'] : '';
		$pdf_ausweisart = isset($data['ausweisart']) ? $data['ausweisart'] : '';
		$pdf_personalausweis_0 = isset($data['personalausweis_0']) ? $data['personalausweis_0'] : '';
		$pdf_reisepass_0 = isset($data['reisepass_0']) ? $data['reisepass_0'] : '';
		$pdf_ausweissnr = isset($data['ausweissnr']) ? $data['ausweissnr'] : '';
		$pdf_ausweisgultig = isset($data['ausweisgultig']) ? $data['ausweisgultig'] : '';
		$pdf_ausstellungsort = isset($data['ausstellungsort']) ? $data['ausstellungsort'] : '';
		$pdf_ausstellungsdatum = isset($data['ausstellungsdatum']) ? $data['ausstellungsdatum'] : '';
		$pdf_aufenthaltsart = isset($data['aufenthaltsart']) ? $data['aufenthaltsart'] : '';
		$pdf_aufenthaltsnr = isset($data['aufenthaltsnr']) ? $data['aufenthaltsnr'] : '';
		$pdf_kreditinstitut = isset($data['kreditinstitut']) ? $data['kreditinstitut'] : '';

		$pdf_blz = isset($data['blz']) ? $data['blz'] : '';
		$pdf_konto = isset($data['konto']) ? $data['konto'] : '';
		$pdf_iban = isset($data['iban']) ? $data['iban'] : '';
		$pdf_bic = isset($data['bic']) ? $data['bic'] : '';
		$pdf_ec_kartennr = isset($data['ec_kartennr']) ? $data['ec_kartennr'] : '';
		$pdf_ec_gueltigkeit = isset($data['ec_gueltigkeit']) ? $data['ec_gueltigkeit'] : '';
		
		$pdf_simcard_typ = isset($data['simcard_typ']) ? $data['simcard_typ'] : '';
		$pdf_mnp = isset($data['mnp']) ? $data['mnp'] : '';
		$pdf_alte_nummer = isset($data['alte_nummer']) ? $data['alte_nummer'] : '';
		$pdf_alt_kdnr = isset($data['alt_kdnr']) ? $data['alt_kdnr'] : '';
		$pdf_ehem_anbieter = isset($data['alt_anbieter']) ? $data['alt_anbieter'] : 'test';
		$pdf_ehem_vertragstyp = isset($data['ehem_vertragstyp']) ? $data['ehem_vertragstyp'] : '';
		$pdf_kuendigungsdatum = isset($data['kuendigungsdatum']) ? $data['kuendigungsdatum'] : '';
		$pdf_telefonbuch = isset($data['telefonbuch']) ? $data['telefonbuch'] : '';
		$pdf_ezv = isset($data['ezv']) ? $data['ezv'] : '';
		
		//ek pdf formular felder
		//ayyildiz ve mobilcom debitel anrede checkbox
		$pdf_frau_check =  '';
		$pdf_herr_check = '';
		$pdf_firma_check = '';
		//ayyildiz vatandaslik checkbox
		$pdf_staats_deutsch =  '';
		$pdf_staats_turk = '';
		$pdf_staats_eu = '';
		$pdf_staats_rest = '';
		//ayyildiz pass sekil checkbox
		$pdf_ausweis_perso = '';
		$pdf_ausweis_pass = '';
		// ayyildiz und Mobilcom Debitel EVN Checkbox
		$pdf_ezv_kurz = '';
		$pdf_ezv_keine = '';
		$pdf_ezv_lang = '';
		$pdf_ezv_ja = '';
		
		//mobilcom debitel Textfeld
		$pdf_perso_gultig = '';
		$pdf_pass_gultig = '';
		$pdf_auswiesno = '';
		$pdf_kontoinh = '';
		
		//Mobilcom telefonbucheintrag checkbox
		$pdf_telefonbuch_ja = '';
		$pdf_telefonbuch_nein = '';
		
		$pdf_staat = $this->convertStaatIdToName($pdf_staat);
		
		$strasse = $pdf_strasse;
		if (isset($_GET['vertragstyp'])) {
			switch ($_GET['vertragstyp']) {
				case 'vodafone': 									break;
				case 'o2': 											break;
				case 'mobilcom': $strasse = ' ' . $pdf_hausnr;   	break;  // nur für mobilcom
				default: break;
			}
		}
		
		// $fdf_data_strings associates the names of the PDF form fields to the PHP variables you just set above. In order to work correctly the PDF form field name has to be exact. PDFs made in Acrobat generally have simpler names - just the name you assigned to the field. PDFs made in LiveCycle Designer nest their forms in other random page elements, creating a long and hairy field name. You can use pdftk to discover the real names of your PDF form fields: run "pdftk form.pdf dump_data_fields > form-fields.txt" to generate a report.

		// Example of field names from a PDF created in LiveCycle:
		// $fdf_data_strings= array('form1[0].#subform[0].#area[0].LastName[0]' => $pdf_lastname,  'form1[0].#subform[0].#area[0].FirstName[0]' => $pdf_firstname, 'form1[0].#subform[0].#area[0].EMail[0]' => $pdf_email, );
		$fdf_data_strings= array(
			'frm_geburtsort'	=> $pdf_geburtsort, 
			'frm_name' 			=> $pdf_name, 
			'frm_vorname' 		=> $pdf_vorname, 
			'str_hausnr'		=> $strasse,
			'frm_strasse' 		=> $pdf_strasse,
			'frm_hno' 			=> $pdf_hausnr,
			'frm_plz' 			=> $pdf_plz, 
			'frm_ort' 			=> $pdf_ort, 
			'frm_gb_datum'	 	=> $pdf_geburtsdatum, 
			'name_des_ver' 		=> $pdf_vorname.$pdf_name, 
			'frm_email'			=> $pdf_email, 
			'frm_telefon'		=> $pdf_rufnummer, 
			'frm_kennwort'		=> $pdf_kennwort, 
			'frm_staats'		=> $pdf_staat, 
			'frm_persono'		=> $pdf_personalausweis_0, 
			'frm_passno'		=> $pdf_reisepass_0, 
			'frm_bank'			=> $pdf_kreditinstitut, 
			'frm_blz'			=> $pdf_blz, 
			'frm_konto'			=> $pdf_konto, 
			'frm_ecno'			=> $pdf_ec_kartennr, 
			'frm_ec_gultig'		=> $pdf_ec_gueltigkeit, 
			'frm_iban'			=> $pdf_iban, 
			'frm_alt_anbieter'	=> $pdf_ehem_anbieter,
			'frm_bic'			=> $pdf_bic, 
			'frm_datum'			=> $pdf_datum,  
			'frm_datum2'		=> $pdf_datum2, 
			'datum'				=> $pdf_datum3,  
			);

		
		// See the documentation of pdftk-php.php for more explanation of these other variables.
		
		// Used for radio buttons and check boxes
		// Example: (For check boxes options are Yes and Off)
		// $pdf_checkbox1 = "Yes";
		// $pdf_checkbox2 = "Off";
		// $pdf_checkbox3 = "Yes";
		// $fdf_data_names = array('checkbox1' => $pdf_checkbox1,'checkbox2' => $pdf_checkbox2,'checkbox3' => $pdf_checkbox3,'checkbox4' => $pdf_checkbox4); 
		//$fdf_data_names = array('herr'=>$pdf_herr, 'frau'=>$pdf_frau, 'firma'=>$pdf_firma,'mobkunde_nein'=>$pdf_mobkunde_nein, 'mobkunde_ja'=>$pdf_mobkunde_ja, ); // Leave empty if there are no radio buttons or check boxes
		$fdf_data_names = array();
		$fields_hidden = array(); // Used to hide form fields
		
		$fields_readonly = array(); // Used to make fields read only - however, flattening the output with pdftk will in effect make every field read only. If you don't want a flattened pdf and still want some read only fields, use this variable and remove the flatten flag near line 70 in pdftk-php.php
		
		// Take each REQUEST value and clean it up for fdf creation
		foreach( $_REQUEST as $key => $value ) {
		   // Translate tildes back to periods
		   $fdf_data_strings[strtr($key, '~', '.')]= $value;
		}
		
		// Name of file to be downloaded
		//$pdf_filename = "Mobilcom Vertrag für $pdf_name , $pdf_vorname.pdf";
		$pdf_filename = "O2_Vertrag für Anrede $pdf_name, $pdf_vorname.pdf";
		
		// Name/location of original, empty PDF form


		if (isset($_GET['vertragstyp'])) {

			switch ($_GET['vertragstyp']) {
				case 'vodafone':
					$pdf_original = "vodafone_mobileconnect_form.pdf";
					break;
				case 'o2':
					$pdf_original = "o2_vertrag_form.pdf";
					break;
				case 'mobilcom':
					$pdf_original = "mobilcomdebitel_form2.pdf";
					break;
				default:
					$pdf_original = "otelo_form.pdf";
					break;
			}
		}
		
		// Finally make the actual PDF file!
		$pdfmaker->make_pdf($fdf_data_strings, $fdf_data_names, $fields_hidden, $fields_readonly, $pdf_original, $pdf_filename);
	}

	public function index() {
		
		$this->load->language('checkout/success');


		if (isset($this->session->data['order_id'])) {
			
			// verringere die Anzahl des Copy-Produkts
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				
				$artnr = $product['model'];
				$anzahl = $product['quantity'];
				$copyPrefix = '_cp';
				if (substr($artnr, -3) == $copyPrefix) {
					$artnr = substr($artnr, 0, strlen($artnr)-3);
				} else {
					$artnr .= $copyPrefix; 
				}
				
				$this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = quantity - {$anzahl} WHERE model = '" . $this->db->escape($artnr) . "'");
			}
			
			
			
			$this->cart->clear();

			// Add to activity log
			$this->load->model('account/activity');


			if ($this->customer->isLogged()) {
				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'order_id'    => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_account', $activity_data);
			} else {
				$activity_data = array(
					'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
					'order_id' => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_guest', $activity_data);
			
			}

			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
			
		}
		

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$vertragsarten = array();
		if (isset($this->session->data['vertragsarten']) && is_array($this->session->data['vertragsarten'])) {
			$vertragsarten = $this->session->data['vertragsarten'];
		}
		$data['vertragsarten'] = $vertragsarten;

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}