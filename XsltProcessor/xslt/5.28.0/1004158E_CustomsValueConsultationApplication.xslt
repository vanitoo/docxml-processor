<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 110н от 18 июля 2022 года "Об установлении Порядка проведения консультаций между таможенным органом и декларантом в целях обоснованного выбора стоимостной основы для определения таможенной стоимости ввозимых товаров в Российскую Федерацию, соответствующей статьям 41 и 42 Таможенного кодекса Евразийского экономического союза" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:acvc="urn:customs.ru:Information:ExchangeDocuments:CustomsValueConsultationApplication:5.25.0">
	<!-- Шаблон для типа CustomsValueConsultationApplicationType -->
	<xsl:template match="acvc:CustomsValueConsultationApplication">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{/*white-space: normal;*/}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 10pt;
					/*font-style: italic;*/}

					.annot
					{font-family: Arial;
					font-size: 10pt;}

					.descr
					{font-family: Arial;
					font-size: 7pt;
					text-align: center}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 10pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr valign="top">
								<td width="60%">
									<table>
										<tbody>
											<tr>
												<td align="right" valign="middle">
													<xsl:text>Начальнику (руководителю)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="5%"/>
								<td width="35%">
									<table>
										<tbody>
											<tr>
												<td class="value" align="center" valign="top">
													<xsl:apply-templates select="acvc:Customs"/>
												</td>
											</tr>
											<tr>
												<td class="descr" align="center">(наименование таможенного органа)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<xsl:text>Заявление № </xsl:text>
									<xsl:choose>
										<xsl:when test="acvc:AppSerialNumber">
											<xsl:value-of select="acvc:AppSerialNumber"/>
										</xsl:when>
										<xsl:otherwise>______</xsl:otherwise>
									</xsl:choose>
									<br/>
									<xsl:text>на проведение консультации в целях выбора стоимостной основы для определения таможенной стоимости ввозимых товаров</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="acvc:OrganizationInfo/cat_ru:OrganizationName"/>
											<xsl:if test="acvc:OrganizationInfo/cat_ru:ShortName">
												<xsl:if test="acvc:OrganizationInfo/cat_ru:OrganizationName">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:value-of select="acvc:OrganizationInfo/cat_ru:ShortName"/>
											</xsl:if>
											<xsl:if test="acvc:OrganizationInfo/cat_ru:OrganizationName or acvc:OrganizationInfo/cat_ru:ShortName">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:if test="acvc:ApplicantSigning/cat_ru:PersonSurname">
												<xsl:value-of select="acvc:ApplicantSigning/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:if test="acvc:ApplicantSigning/cat_ru:PersonName">
												<xsl:apply-templates select="acvc:ApplicantSigning/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:if test="acvc:ApplicantSigning/cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="acvc:ApplicantSigning/cat_ru:PersonMiddleName"/>
											</xsl:if>
											<xsl:if test="acvc:ApplicantSigning/cat_ru:PersonPost">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="acvc:ApplicantSigning/cat_ru:PersonPost"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(полное и краткое наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), должность, фамилия, имя, отчество (при наличии) руководителя (для юридического лица), фамилия, имя, отчество (при наличии) уполномоченного представителя)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="acvc:OrganizationInfo/RUScat_ru:SubjectAddressDetails">
												<xsl:if test="position()!=1">
													<xsl:text>; </xsl:text>
												</xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(почтовый адрес (для физического лица)/место нахождения юридического лица и его почтовый адрес)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
												<xsl:text> ИНН - </xsl:text>
												<xsl:value-of select="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											</xsl:if>
											<xsl:if test="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
												<xsl:if test="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:text> ОГРН/ОГРНИП - </xsl:text>
												<xsl:value-of select="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
											</xsl:if>
											<xsl:if test="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
												<xsl:if test="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN or acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<xsl:text>, </xsl:text>
												</xsl:if>
												<xsl:text> КПП - </xsl:text>
												<xsl:value-of select="acvc:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(идентификационный номер налогоплательщика (далее - ИНН), основной государственный регистрационный номер индивидуального предпринимателя - для физического лица; ИНН/код причины постановки на учет - для юридического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="acvc:OrganizationInfo/RUScat_ru:IdentityCard" mode="identity_card"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(серия, номер паспорта, кем и когда выдан (для физического лица))'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align:justify;">
									<xsl:text>Прошу провести консультацию в целях выбора стоимостной основы для определения таможенной стоимости (далее - консультацию) в отношении следующих ввозимых товаров:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsDescription"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(торговое, коммерческое или иное традиционное наименование)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="acvc:GoodInfo/acvc:Appointment"/>
											<xsl:if test="acvc:GoodInfo/acvc:TradeMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:TradeMark"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsMark"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsModel">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsModel"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsMarking">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsMarking"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsStandard">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsStandard"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsSort">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsSort"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodFunctions">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodFunctions"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:TechSpecifications">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:TechSpecifications"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:CommSpecifications">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:CommSpecifications"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(назначение, товарный знак, марка, модель, артикул, сорт, стандарты, выполняемые функции, технические и коммерческие характеристики)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>отправитель - </xsl:text>
											<xsl:apply-templates select="acvc:GoodInfo/acvc:OrganizationSender"/>
											<xsl:if test="acvc:GoodInfo/acvc:OrganizationSeller">
												<xsl:text>; продавец - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:OrganizationSeller"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:Manufacturer">
												<xsl:text>; производитель - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:Manufacturer"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodsTNVEDCode">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodsTNVEDCode"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:DepartureCountry/acvc:CountryCode">
												<xsl:text>; страна отправления - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:DepartureCountry/acvc:CountryCode"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:CountryOrigin/acvc:CountryCode">
												<xsl:text>; страна происхождения - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:CountryOrigin/acvc:CountryCode"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GrossWeightQuantity">
												<xsl:text>; вес брутто - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GrossWeightQuantity"/>
												<xsl:text> кг</xsl:text>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:NetWeightQuantity">
												<xsl:text>; вес нетто - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:NetWeightQuantity"/>
												<xsl:text> кг</xsl:text>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:SupplQuantity">
												<xsl:text>; </xsl:text>
												<xsl:for-each select="acvc:GoodInfo/acvc:SupplQuantity">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:apply-templates select="." mode="quantity"/>
												</xsl:for-each>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(краткое наименование организации либо фамилия, имя, отчество (при наличии) отправителя, продавца, производителя товара, десятизначный классификационный код ТН ВЭД, код страны отправления и происхождения товара, вес брутто/нетто и количество товара в основных и (или) дополнительных (при наличии) единицах измерения)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="acvc:GoodInfo/acvc:ImportedGoodPrice">
												<xsl:text>цена - </xsl:text>
												<xsl:for-each select="acvc:GoodInfo/acvc:ImportedGoodPrice">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:apply-templates select="acvc:InvoicedCost"/>
													<xsl:if test="acvc:GoodFeatures or acvc:GoodsMeasureQuantity">
														<xsl:text> (</xsl:text>
														<xsl:apply-templates select="acvc:GoodFeatures"/>
														<xsl:if test="acvc:GoodsMeasureQuantity">
															<xsl:if test="acvc:GoodFeatures">
																<xsl:text>, </xsl:text>
															</xsl:if>
															<xsl:text>кол-во: </xsl:text>
															<xsl:for-each select="acvc:GoodsMeasureQuantity">
																<xsl:if test="position()!=1">, </xsl:if>
																<xsl:apply-templates select="." mode="quantity"/>
															</xsl:for-each>
														</xsl:if>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:GoodCurrency">
												<xsl:if test="acvc:GoodInfo/acvc:ImportedGoodPrice">
													<xsl:text>; </xsl:text>
												</xsl:if>
												<xsl:text>валюта стоимости - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodCurrency/acvc:CurrencyName"/>
												<xsl:text> (</xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:GoodCurrency/acvc:CurrencyCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(цена ввозимых товаров с указанием полного наименования и буквенного кода валюты)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>вид ТС - </xsl:text>
											<xsl:apply-templates select="acvc:GoodInfo/acvc:DeliveryTerms/acvc:TransportKind"/>
											<xsl:text>; условия поставки - </xsl:text>
											<xsl:apply-templates select="acvc:GoodInfo/acvc:DeliveryTerms/acvc:DeliveryTermsStringCode"/>
											<xsl:if test="acvc:GoodInfo/acvc:DeliveryTerms/acvc:GoodsTransferFeature">
												<xsl:text>; особенность перемещения - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:DeliveryTerms/acvc:GoodsTransferFeature"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:EAEUImportDate">
												<xsl:text>; дата ввоза - </xsl:text>
												<xsl:apply-templates select="acvc:GoodInfo/acvc:EAEUImportDate" mode="russian_date"/>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:PakageInfo">
												<xsl:text>;</xsl:text>
												<xsl:for-each select="acvc:GoodInfo/acvc:PakageInfo">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:for-each select="*">
														<xsl:text> </xsl:text>
														<xsl:choose>
															<xsl:when test="local-name() = 'PakageTypeCode'">
																<xsl:choose>
																	<xsl:when test=".='0'">без упаковки</xsl:when>
																	<xsl:when test=".='1'">с упаковкой</xsl:when>
																	<xsl:when test=".='2'">без упаковки в оборудованных емкостях транспортного средства</xsl:when>
																	<xsl:otherwise>
																		<xsl:apply-templates select="."/>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:when>
															<xsl:otherwise>
																<xsl:apply-templates select="."/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(вид транспортного средства международной перевозки, на котором товары прибыли на таможенную территорию ЕАЭС, условия поставки, особенности перемещения, дата ввоза товаров на таможенную территорию ЕАЭС, описание упаковки и упаковочных материалов)'"/>
										<xsl:with-param name="comma" select="1"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text>причины неприменимости метода по стоимости сделки с ввозимыми товарами - </xsl:text>
											<xsl:apply-templates select="acvc:GoodInfo/acvc:MethodNotApplicableReasons"/>
											<xsl:if test="acvc:GoodInfo/acvc:PrevConsultationsInfo">
												<xsl:text>; проведенная(-ые) ранее консультации - </xsl:text>
												<xsl:for-each select="acvc:GoodInfo/acvc:PrevConsultationsInfo">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:if test="acvc:GoodFeatures">
														<xsl:text>№ </xsl:text>
														<xsl:apply-templates select="acvc:GoodFeatures"/>
													</xsl:if>
													<xsl:if test="acvc:ConsultationDate">
														<xsl:text> от </xsl:text>
														<xsl:apply-templates select="acvc:ConsultationDate"/>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="acvc:GoodInfo/acvc:AdditionalInfo">
												<xsl:text>; </xsl:text>
												<xsl:for-each select="acvc:GoodInfo/acvc:AdditionalInfo">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(причины, по которым метод по стоимости сделки с ввозимыми товарами неприменим, дата и регистрационный номер ранее проведенной консультации, другая информация, имеющая значение, по мнению декларанта, для выбора таможенным органом стоимостной основы при определении таможенной стоимости)'"/>
										<xsl:with-param name="comma" select="1"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>ввозимых в Российскую Федерацию (далее - ввозимые товары) в соответствии с внешнеэкономическим договором (контрактом) купли-продажи от </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="acvc:GoodInfo/acvc:PurchaseAgreement/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'30mm'"/>
									</xsl:call-template>
									&#160;<xsl:text>№ </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="acvc:GoodInfo/acvc:PurchaseAgreement/cat_ru:PrDocumentNumber"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'60mm'"/>
									</xsl:call-template>
									<xsl:text>, а также приложениями, дополнениями и изменениями к нему:</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:for-each select="acvc:GoodInfo/acvc:AppPurchaseAgreement">
												<xsl:if test="position()!=1">; </xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
											</xsl:for-each>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(номера (при наличии) и даты действующих приложений, дополнений и изменений к нему (при наличии), содержащих условия сделки, имеющие отношение к ввозимым товарам)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align:justify;">
									<xsl:text>Перечень прилагаемых документов</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered annot">№ п/п</td>
								<td class="bordered annot">Код документа и (или) сведений в соответствии с классификатором видов документов и сведений</td>
								<td class="bordered annot">Наименование документа и (или) сведений</td>
								<td class="bordered annot">Номер документа и (или) сведений (при наличии)</td>
								<td class="bordered annot">Дата документа и (или) сведений (при наличии)</td>
								<td class="bordered annot">Идентификационный номер, автоматически присваиваемый документу после его размещения в ЭАДД</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered annot">1</td>
								<td class="bordered annot">2</td>
								<td class="bordered annot">3</td>
								<td class="bordered annot">4</td>
								<td class="bordered annot">5</td>
								<td class="bordered annot">6</td>
							</tr>
							<xsl:for-each select="acvc:AttachedDocuments">
								<tr valign="top">
									<td class="bordered annot">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="acvc:DocCode"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cat_ru:PrDocumentName"/>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
									</td>
									<td class="bordered annot">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
									<td class="bordered annot">
										<xsl:apply-templates select="acvc:ArchDocID"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align:justify;">
									<xsl:text>Согласие на обработку персональных данных.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:for-each select="acvc:ApplicantSigning">
						<table>
							<tbody>
								<tr valign="bottom" align="center">
									<td class="value" width="15%"></td>
									<td width="5%"/>
									<td class="value" width="45%">
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
									</td>
									<td width="5%"/>
									<td class="value" width="30%">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="RUScat_ru:SigningDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr align="center">
									<td class="descr" width="15%">Подпись</td>
									<td width="5%"/>
									<td class="descr" width="45%">Фамилия, имя, отчество (при наличии)</td>
									<td width="5%"/>
									<td class="descr" width="30%">(число, месяц, год)</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="acvc:OrganizationInfo/RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode = 1">адрес регистрации: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 2">фактический адрес: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 3">почтовый адрес: </xsl:when>
				<xsl:otherwise>
					<xsl:text>(код вида адреса: </xsl:text>
					<xsl:apply-templates select="RUScat_ru:AddressKindCode"/>
					<xsl:text>) </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:apply-templates select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:AddressText)">
			<xsl:if test="RUScat_ru:PostalCode">
				<xsl:apply-templates select="RUScat_ru:PostalCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CounryName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Region"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:District"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Town"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:City"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:House"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Room"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<xsl:text>, ОКТМО </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<xsl:text>, ОKАTO </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<xsl:text>, КЛАДР </xsl:text>
				<xsl:apply-templates select="RUScat_ru:KLADR"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<xsl:text>, Глобальный идентификатор адресного объекта по ФИАС </xsl:text>
				<xsl:apply-templates select="RUScat_ru:AOGUID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<xsl:text>, Код единицы административно-территориального деления </xsl:text>
				<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<xsl:text>, а/я </xsl:text>
				<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="identity_card">
		<xsl:text> документ: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>

	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 and $list != 0 and $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="acvc:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
	</xsl:template>

	<xsl:template match="//*[local-name()='CustomsValueConsultationApplication']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
