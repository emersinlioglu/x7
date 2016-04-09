<?php
class ControllerCheckoutVertragsdaten extends Controller {
	
	public function index() {
	
	

		$data['products'] = array();

		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->response->redirect($this->url->link('checkout/cart'));
			}
			$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}


$data['products'][] = array(
					'cart_id'   => $product['cart_id'],
				
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
				
					'quantity'  => $product['quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					
				
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);



		}
		
		// Custom Fields
		$data['button_continue'] = $this->language->get('button_continue');


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/vertragsdaten.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/checkout/vertragsdaten.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/checkout/vertragsdaten.tpl', $data));
		}
	}

	public function save() {
		$this->load->language('checkout/checkout');

		$json = array();

/*
 [payment_address] => Array
                (
                    [firstname] => sasa
                    [lastname] => sasa
                    [company] => daas
                    [address_1] => sasaa
                    [address_2] => sasaas
                    [postcode] => 1233
                    [city] => sasasa
                    [country_id] => 81
                    [zone_id] => 1257
                    [country] => Germany
                    [iso_code_2] => DE
                    [iso_code_3] => DEU
                    [address_format] => {company}
{firstname} {lastname}
{address_1}
{address_2}
{postcode}

                    [custom_field] => Array
                        (
                        )

                    [zone] => Brandenburg
                    [zone_code] => BRG
                )
*/
		$this->session->data['vertragsdaten']['vorname'] = $this->session->data['payment_address']['firstname'];
		$this->session->data['vertragsdaten']['name'] = $this->session->data['payment_address']['lastname'];
		$this->session->data['vertragsdaten']['firma'] = $this->session->data['payment_address']['company'];
		$this->session->data['vertragsdaten']['strasse'] = $this->session->data['payment_address']['address_1'];
		$this->session->data['vertragsdaten']['hausnr'] = $this->session->data['payment_address']['address_1'];
		$this->session->data['vertragsdaten']['plz'] = $this->session->data['payment_address']['postcode'];
		$this->session->data['vertragsdaten']['ort'] = $this->session->data['payment_address']['city'];

		

		// Validate minimum quantity requirements.
		/*
		// Frau
		if (!isset($this->request->post['frau'])) {
			$json['error']['warning'] = "Frau fehlt";
		} else {
			$frau = $this->request->post['frau'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['frau'] = strip_tags($this->request->post['frau']);
		}
		
		// Herr
		if (!isset($this->request->post['herr'])) {
			$json['error']['warning'] = "Herr fehlt";
		} else {
			$herr = $this->request->post['herr'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['herr'] = strip_tags($this->request->post['herr']);
		}
		*/
		/*
		// Firma
		if (!isset($this->request->post['firma'])) {
			$json['error']['warning'] = "Firma fehlt";
		} else {
			$firma = $this->request->post['firma'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['firma'] = strip_tags($this->request->post['firma']);
		}
		
	*/
		//Geburtsort		
		if (!isset($this->request->post['geburtsort'])) {
			$json['error']['warning'] = "Geburtsort fehlt";
		} else {
			$geburtsort = $this->request->post['geburtsort'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['geburtsort'] = strip_tags($this->request->post['geburtsort']);
		}
		
/*
		// Vorname
		if (!isset($this->request->post['vorname'])) {
			$json['error']['warning'] = "Vorname fehlt";
		} else {
			$vorname = $this->request->post['vorname'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['vorname'] = strip_tags($this->request->post['vorname']);
		}
		
		// Name
		if (!isset($this->request->post['name'])) {
			$json['error']['warning'] = "Name fehlt";
		} else {
			$name = $this->request->post['name'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['name'] = strip_tags($this->request->post['name']);
		}
		
		// Strasse
		if (!isset($this->request->post['strasse'])) {
			$json['error']['warning'] = "Strasse fehlt";
		} else {
			$strasse = $this->request->post['strasse'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['strasse'] = strip_tags($this->request->post['strasse']);
		}
		
		// Hausnummer
		if (!isset($this->request->post['hausnr'])) {
			$json['error']['warning'] = "Hausnummer fehlt";
		} else {
			$hausnr = $this->request->post['hausnr'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['hausnr'] = strip_tags($this->request->post['hausnr']);
		}
		
		// PLZ
		if (!isset($this->request->post['plz'])) {
			$json['error']['warning'] = "PLZ fehlt";
		} else {
			$plz = $this->request->post['plz'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['plz'] = strip_tags($this->request->post['plz']);
		}
		
		// Ort
		if (!isset($this->request->post['ort'])) {
			$json['error']['warning'] = "Ort fehlt";
		} else {
			$ort = $this->request->post['ort'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ort'] = strip_tags($this->request->post['ort']);
		}
		
		// Email
		if (!isset($this->request->post['email'])) {
			$json['error']['warning'] = "Email fehlt";
		} else {
			$email = $this->request->post['email'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['email'] = strip_tags($this->request->post['email']);
		}
		
		// Rufnummer
		if (!isset($this->request->post['rufnummer'])) {
			$json['error']['warning'] = "Rufnummer fehlt";
		} else {
			$rufnummer = $this->request->post['rufnummer'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['rufnummer'] = strip_tags($this->request->post['rufnummer']);
		}
		*/
		// Geburtsdatum 
		if (!isset($this->request->post['geburtsdatum'])) {
			$json['error']['warning'] = "Geburtsdatum fehlt";
		} else {
			$geburtsdatum = $this->request->post['geburtsdatum'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['geburtsdatum'] = strip_tags($this->request->post['geburtsdatum']);
		}
		
		// Kennwort
		if (!isset($this->request->post['kennwort'])) {
			$json['error']['warning'] = "Kennwort fehlt";
		} else {
			$kennwort = $this->request->post['kennwort'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['kennwort'] = strip_tags($this->request->post['kennwort']);
		}
		
		// Staatsangehörigkeit
		if (!isset($this->request->post['staat']) || empty($this->request->post['staat'])) {
			$json['error']['warning'] = "Staatangehoerigkeit fehlt";
		} else {
			$ausweisart = '';
			$staat = $this->request->post['staat'];
			// Ausweisart
			if (!isset($this->request->post['ausweisart'])) {
				$json['error']['warning'] = "Ausweisart fehlt";
			} else {
				$ausweisart = $this->request->post['ausweisart'];
			}

			if (!$json) {
				$this->session->data['vertragsdaten']['ausweisart'] = strip_tags($this->request->post['ausweisart']);
			}


			$checkPersonalausweis_0 = false;
			$checkReisepass_0 = false;
			$checkAusweisnr = false;

			$checkAufenthaltsart = false;
			$checkoutAufenthaltsnr = false;
			// 13 = Deutschland
			if ($staat == 13) {

				switch($ausweisart) {
					case 0: 
						$checkPersonalausweis_0 = true;
						break;
					case 1:
						$checkReisepass_0 = true;
						break;
					case 2:
						$checkAusweisnr = true;
						break;
				}
			} else {


				$checkAufenthaltsart = true;
				$checkoutAufenthaltsnr = true;


			}




			// Personummer
			if ($checkPersonalausweis_0) {
				if (!isset($this->request->post['personalausweis_0']) || empty($this->request->post['personalausweis_0'])) {
					$json['error']['warning'] = "Personalausweisnummer fehlt";
				} else {
					$personalausweis_0 = $this->request->post['personalausweis_0'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['personalausweis_0'] = strip_tags($this->request->post['personalausweis_0']);
				}
			}

			if ($checkReisepass_0) {
				// Reisepassnummer
				if (!isset($this->request->post['reisepass_0']) || empty($this->request->post['reisepass_0'])) {
					$json['error']['warning'] = "Reisepassnummer fehlt";
				} else {
					$reisepass_0 = $this->request->post['reisepass_0'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['reisepass_0'] = strip_tags($this->request->post['reisepass_0']);
				}
			}


			if ($checkAusweisnr) {
				// Ausländischer Ausweisnummer
				if (!isset($this->request->post['ausweisnr']) || empty($this->request->post['ausweisnr'])) {
					$json['error']['warning'] = "Ausweisnummer fehlt";
				} else {
					$ausweisnr = $this->request->post['ausweisnr'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['ausweisnr'] = strip_tags($this->request->post['ausweisnr']);
				}
			}


			$checkAufenthaltBisDatum = false;

			if ($checkAufenthaltsart) {
				// Aufenthaltsart

			

				if (!isset($this->request->post['aufenthaltsart']) || $this->request->post['aufenthaltsart']< 0)  {
					$json['error']['warning'] = "Aufenthaltsart fehlt";
				} else {
					$aufenthaltsart = $this->request->post['aufenthaltsart'];

					if ($aufenthaltsart == 1) {
						$checkAufenthaltBisDatum = true;
					}					
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['aufenthaltsart'] = strip_tags($this->request->post['aufenthaltsart']);
				}
			}


			if ($checkAufenthaltBisDatum) {
				//d_aufenthalt_bis
				//m_aufenthalt_bis
				//y_aufenthalt_bis


				// TODO: Check date
			}



		}

		if (!$json) {
			$this->session->data['vertragsdaten']['staat'] = strip_tags($this->request->post['staat']);
		}
		
		
		
		
		
		
		

		
		// Ausweisgültigkeit
	/*	if (!isset($this->request->post['ausweisgultig'])) {
			$json['error']['warning'] = "Ausweisgueltigkeit fehlt";
		} else {
			$ausweisgultig = $this->request->post['ausweisgultig'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ausweisgultig'] = strip_tags($this->request->post['ausweisgultig']);
  	}*/
		
			// Ausstellungsort
		if (!isset($this->request->post['ausstellungsort'])) {
			$json['error']['warning'] = "Ausstellungsort fehlt";
		} else {
			$ausstellungsort = $this->request->post['ausstellungsort'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ausstellungsort'] = strip_tags($this->request->post['ausstellungsort']);
		}
		
		// Ausstellungsdatum
		if (!isset($this->request->post['ausstellungsdatum'])) {
			$json['error']['warning'] = "Ausstellungsdatum fehlt";
		} else {
			$ausstellungsdatum = $this->request->post['ausstellungsdatum'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ausstellungsdatum'] = strip_tags($this->request->post['ausstellungsdatum']);
		}
		

		
		// Aufenthaltsnummer
		if (!isset($this->request->post['aufenthaltsnr'])) {
			$json['error']['warning'] = "Aufenthaltsnummer fehlt";
		} else {
			$aufenthaltsnr = $this->request->post['aufenthaltsnr'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['aufenthaltsnr'] = strip_tags($this->request->post['aufenthaltsnr']);
		}
		
		// Bank
		if (!isset($this->request->post['kreditinstitut'])) {
			$json['error']['warning'] = "Bank fehlt";
		} else {
			$kreditinstitut = $this->request->post['kreditinstitut'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['kreditinstitut'] = strip_tags($this->request->post['kreditinstitut']);
		}
		
		// BLZ
		if (!isset($this->request->post['blz'])) {
			$json['error']['warning'] = "BLZ fehlt";
		} else {
			$blz = $this->request->post['blz'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['blz'] = strip_tags($this->request->post['blz']);
		}
		
		// Kontonummer
		if (!isset($this->request->post['konto'])) {
			$json['error']['warning'] = "Kontonummer fehlt";
		} else {
			$konto = $this->request->post['konto'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['konto'] = strip_tags($this->request->post['konto']);
		}
		
		// IBAN
		if (!isset($this->request->post['iban'])) {
			$json['error']['warning'] = "IBAN fehlt";
		} else {
			$iban = $this->request->post['iban'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['iban'] = strip_tags($this->request->post['iban']);
		}
		
		// BIC
		if (!isset($this->request->post['bic'])) {
			$json['error']['warning'] = "BIC fehlt";
		} else {
			$bic = $this->request->post['bic'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['bic'] = strip_tags($this->request->post['bic']);
		}
		
		// ECNR
		if (!isset($this->request->post['ec_kartennr'])) {
			$json['error']['warning'] = "Ecnummer fehlt";
		} else {
			$ec_kartennr = $this->request->post['ec_kartennr'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ec_kartennr'] = strip_tags($this->request->post['ec_kartennr']);
		}
		
		// EC Gültigkeit
		if (!isset($this->request->post['ec_gueltigkeit'])) {
			$json['error']['warning'] = "EC-Karte Gültigkeit fehlt";
		} else {
			$ec_gueltigkeit = $this->request->post['ec_gueltigkeit'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ec_gueltigkeit'] = strip_tags($this->request->post['ec_gueltigkeit']);
		}
		

		
		// Simkart Typ
		if (!isset($this->request->post['simcard_typ'])) {
			$json['error']['warning'] = "Simcard Typ fehlt";
		} else {
			$simcard_typ = $this->request->post['simcard_typ'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['simcard_typ'] = strip_tags($this->request->post['simcard_typ']);
		}
		
		
		// Rufnummer Mitnahme
		if (!isset($this->request->post['mnp']) || $this->request->post['mnp'] < 0) {
			$json['error']['warning'] = "Rufnummer Mitnahme fehlt";
		} else {
			$mnp = $this->request->post['mnp'];


			$checkAlte_nummer = false;
			$checkEhem_vertragstyp = false;
			$checkAlt_kdnr = false;
			$checkEhem_anbieter = false;
			$checkKuendigungsdatum = false;
			switch ($mnp) {
				case 1:
					$checkAlte_nummer = true;
					$checkEhem_vertragstyp = true;
					$checkAlt_kdnr = true;
					$checkEhem_anbieter = true;
					$checkKuendigungsdatum = true;
					break;
				case 2:
					$checkAlte_nummer = true;
					$checkEhem_vertragstyp = true;
					$checkAlt_kdnr = true;
					$checkEhem_anbieter = true;
					break;
			}



			if($checkAlte_nummer) {
				// Alte Rufnummer
				if (!isset($this->request->post['alte_nummer']) || empty($this->request->post['alte_nummer'])) {
					$json['error']['warning'] = "Alte Rufnnummer";
				} else {
					$alte_nummer = $this->request->post['alte_nummer'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['alte_nummer'] = strip_tags($this->request->post['alte_nummer']);
				}

				// Alter Vertragstyp
				if (!isset($this->request->post['ehem_vertragstyp']) || $this->request->post['ehem_vertragstyp'] < 0) {
					$json['error']['warning'] = "Alter Vertragstyp fehlt";
				} else {
					$ehem_vertragstyp = $this->request->post['ehem_vertragstyp'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['ehem_vertragstyp'] = strip_tags($this->request->post['ehem_vertragstyp']);
				}

				// Alte Kundennummer
				if (!isset($this->request->post['alt_kdnr']) || empty($this->request->post['alt_kdnr'])) {
					$json['error']['warning'] = "Alte Kundennummer";
				} else {
					$alt_kdnr = $this->request->post['alt_kdnr'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['alt_kdnr'] = strip_tags($this->request->post['alt_kdnr']);
				}

				// Alter Anbieter
				if (!isset($this->request->post['ehem_anbieter']) || empty($this->request->post['ehem_anbieter'])) {
					$json['error']['warning'] = "Anbieter fehlt";
				} else {
					$ehem_anbieter = $this->request->post['ehem_anbieter'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['ehem_anbieter'] = strip_tags($this->request->post['ehem_anbieter']);
				}
			}

			if ($checkKuendigungsdatum) {
			 	// Kündigungsdatum
				if (!isset($this->request->post['kuendigungsdatum']) || empty($this->request->post['kuendigungsdatum'])) {
					$json['error']['warning'] = "Kündigungsdatum fehlt";
				} else {
					$kuendigungsdatum = $this->request->post['kuendigungsdatum'];
				}

				if (!$json) {
					$this->session->data['vertragsdaten']['kuendigungsdatum'] = strip_tags($this->request->post['kuendigungsdatum']);
				}
			}


		}

		if (!$json) {
			$this->session->data['vertragsdaten']['mnp'] = strip_tags($this->request->post['mnp']);
		}
		
		
		
		 // Telefonbucheintrag
		if (!isset($this->request->post['telefonbuch'])) {
			$json['error']['warning'] = "Telefonbucheintrag fehlt";
		} else {
			$telefonbuch = $this->request->post['telefonbuch'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['telefonbuch'] = strip_tags($this->request->post['telefonbuch']);
		}
		
		 // Einzelverbindungsnachweis
		if (!isset($this->request->post['ezv'])) {
			$json['error']['warning'] = "Einzelverbindungsnachweis fehlt";
		} else {
			$ezv = $this->request->post['ezv'];
		}

		if (!$json) {
			$this->session->data['vertragsdaten']['ezv'] = strip_tags($this->request->post['ezv']);
		}


		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}