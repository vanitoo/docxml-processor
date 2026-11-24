<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:paycd="urn:customs.ru:Information:ExchangeDocuments:PaymentConfirmDocs:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PaymentConfirmDocsType -->
	<xsl:template match="paycd:PaymentConfirmDocs">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
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

					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align:top;}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Подтверждение<br/>уплаты таможенных пошлин, налогов, таможенных пошлин<br/>и внутренних налогов в отношении товаров электронной торговли</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="35%">
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="paycd:Customs"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование таможенного органа Российской Федерации)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td></td>
								<td width="35%">
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="paycd:Date" mode="russian_date"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(дата формирования)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:text>Сведения о лице, подавшем заявление о предоставлении подтверждения уплаты таможенных пошлин, налогов, таможенных пошлин и внутренних налогов в отношении товаров электронной торговли:</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value" width="100%">
									<xsl:apply-templates select="paycd:Payer/cat_ru:OrganizationName"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование юридического лица, фамилия имя, отчетство (при наличии) индивидуального предпринимателя или физического лица)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value" width="100%">
									<xsl:apply-templates select="paycd:Payer" mode="payerIinAndDoc"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(в отношении лиц, состоящих на учете в налоговых органах Российской Федерации, – идентификационный номер налогоплательщика  ; в отношении юридических лиц и индивидуальных предпринимателей, не состоящих  на учете в налоговых органах Российской Федерации, – наименование страны и регистрационный номер (код налогоплательщика (налоговый номер) или его аналог) в стране регистрации; в отношении физических лиц,  не состоящих на учете в налоговых органах Российской Федерации, – наименование, серия, номер, страна выдачи документа, удостоверяющего личность)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>на № </xsl:text>
					<span class="value" style="display: inline-block; width: 80mm; border-bottom: 1px solid black; text-align:center;">
						<xsl:apply-templates select="paycd:AppNumber/cat_ru:PrDocumentNumber"/>
					</span>
					<xsl:text> от </xsl:text>
					<span class="value" style="display: inline-block; width: 80mm; border-bottom: 1px solid black; text-align:center;">
						<xsl:apply-templates select="paycd:AppNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
					</span>
					<div class="descr" align="center">(номер, дата заявления юридического лица, индивидуального предпринимателя или физического лица)</div>
					<br/>
					<xsl:text>За период с </xsl:text>
					<span class="value" style="display: inline-block; width: 50mm; border-bottom: 1px solid black; text-align:center;">
						<xsl:apply-templates select="paycd:PeriodBegin" mode="russian_date"/>
					</span>
					<xsl:text> по </xsl:text>
					<span class="value" style="display: inline-block; width: 50mm; border-bottom: 1px solid black; text-align:center;">
						<xsl:apply-templates select="paycd:PeriodEnd" mode="russian_date"/>
					</span>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered title" colspan="3">Реквизиты документа, в соответствии с которым осуществена уплата таможенных пошлин, налогов, таможенных пошлин и внутренних налогов в отношении оваров электронной торговли</td>
								<td class="bordered title" rowspan="2">вид платежа</td>
								<td class="bordered title" rowspan="2">сумма платежа</td>
								<td class="bordered title" colspan="2">лицо, уплатившее или за счет денежных средств (денег) которого взысканы суммы платежей</td>
							</tr>
							<tr valign="top" align="center">
								<td class="bordered title">наименование документа</td>
								<td class="bordered title">дата документа</td>
								<td class="bordered title">номер документа</td>
								<td class="bordered title">ИНН лица</td>
								<td class="bordered title">наименование лица</td>
							</tr>
							<xsl:apply-templates select="paycd:PaymentDocument"/>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="30%">Уполномоченное должностное лицо<br/>таможенного органа</td>
								<td width="1%"></td>
								<td width="10%">
									<xsl:apply-templates select="paycd:CustomsChief/cat_ru:IssueDate" mode="russian_date"/>
								</td>
								<td width="1%"></td>
								<td width="10%"></td>
								<td width="1%"></td>
								<td width="48%">
									<xsl:apply-templates select="paycd:CustomsChief"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(дата)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(подпись)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(должность, фамилия, имя, отчество (при наличии)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CodeListId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер факса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Telex"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:E_mail">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:choose>
			<xsl:when test="RUScat_ru:FullIdentityCardName">
				<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
			</xsl:otherwise>
		</xsl:choose>
			
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<xsl:text>, серия: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<xsl:text>, номер: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>, страна: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">
							<xsl:text>адрес регистрации</xsl:text>
						</xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">
							<xsl:text>фактический адрес</xsl:text>
						</xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">
							<xsl:text>почтовый адрес</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="RUScat_ru:AddressKindCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostalCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CountryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:CounryName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Region"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:District"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Town"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:City"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:House"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:Room"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AddressText"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKTMO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:OKATO"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:KLADR"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOGUID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:AOID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UITNCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text> ИНН/ПИН </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> УНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text> БИН </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="paycd:AppNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="paycd:Customs">
		<xsl:apply-templates select="*" mode="splitComma"/>
	</xsl:template>
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() != 'AddressText']" mode="splitComma"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[local-name() = 'AddressKindCode']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Адрес регистрации</xsl:when>
				<xsl:when test=". = 2">Фактический адрес</xsl:when>
				<xsl:when test=". = 3">Почтовый адрес</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="paycd:CustomsChief">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:apply-templates select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<!-- Шаблон для типа paycd:DocIDType -->
	<xsl:template match="paycd:DocID">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="paycd:OrderPayment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Сумма</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код валюты в соответствии с Классификатором валют</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа paycd:PayerType -->
	<xsl:template match="paycd:Payer" mode="payerIinAndDoc">
		<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа paycd:PaymentDocumentType -->
	<xsl:template match="paycd:PaymentDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="paycd:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="paycd:Amount" mode="translate_number"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="paycd:INN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="paycd:OrganizationName"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа paycd:TPORegNumberType -->
	<xsl:template match="paycd:TPORegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="paycd:CustomsCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="paycd:RegistrationDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="paycd:RegistrationDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="paycd:DocNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа по журналу регистрации/типографский номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="paycd:DocNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="paycd:NumPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Порядковый номер вносимых изменений</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="paycd:NumPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<xsl:template match="//*[local-name()='PaymentConfirmDocs']//*" priority="-1">
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
