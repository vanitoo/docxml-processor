<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:oez_ci="urn:customs.ru:Information:CustomsDocuments:OEZ_ConclusionIdentif:5.25.0">
	<!-- Шаблон для типа OEZ_ConclusionIdentifType -->
	<xsl:template match="oez_ci:OEZ_ConclusionIdentif">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  font-family: Arial;
                  background: #cccccc;
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
                  border: solid 1px black;
                  }
                  th.bordered
                  {
                  border: solid 1px black;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                  
                  .descr {
					font-size: 8pt;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="48%">
									<xsl:text>Регистрационный номер </xsl:text>
									<u><xsl:apply-templates select="oez_ci:ConclusionRegNumber" mode="reg_num"/></u>
									<br/>
									<xsl:text>Дата выдачи </xsl:text>
									<u><xsl:apply-templates select="oez_ci:ConclusionIssueDate" mode="russian_date"/></u>
								</td>
								<td width="4%"></td>
								<td width="48%" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:Rezident" mode="org"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td></td>
								<td></td>
								<td class="descr">(резидент Арктической зоны Российской Федерации или лицо, им уполномоченное)<sup>1</sup></td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div style="width:100%; font-weight: bold; text-align: center;">
						<xsl:text>Заключение о возможности идентификации ввозимых товаров</xsl:text>
					</div>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="50%">
									<xsl:text>Рассмотрев уведомление о ввозе товаров №</xsl:text>
								</td>
								<td width="50%" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:ImportNoticeRegNumber" mode="reg_num"/>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="descr">(регистрационный номер уведомления о ввозе товаров<sup>2</sup>)</td>
							</tr>
							<tr>
								<td colspan="2">
									<xsl:text>и представленные документы сообщаем о приемлемости заявленного способа идентификации в отношении ввозимых резидентом Арктической зоны Российской Федерации</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:Rezident" mode="org_short"/>
								</td>
							</tr>
							<tr align="center">
								<td colspan="2" class="descr">(резидент Арктической зоны Российской Федерации<sup>3</sup>)</td>
							</tr>
							<tr>
								<td colspan="2">товаров:</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<th class="bordered">№ п/п <sup>4</sup></th>
								<th class="bordered">Наименование товара<sup>5</sup></th>
								<th class="bordered">Номер товара<sup>6</sup></th>
								<th class="bordered">Способ идентификации<sup>7</sup></th>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:for-each select="oez_ci:GoodsList">
								<tr>
									<td class="bordered" align="center">
										<xsl:apply-templates select="oez_ci:Position"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="oez_ci:GoodsDescription"/>
									</td>
									<td class="bordered" align="center">
										<xsl:apply-templates select="oez_ci:NoticeSequenceNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="oez_ci:IdentificationMethod"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="30%">Начальник таможенного органа</td>
								<td width="5%"></td>
								<td width="30%" style="border-bottom: 1px solid black;"></td>
								<td width="5%"></td>
								<td width="30%" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:CustomsSignature" mode="FIO"/>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="30%" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:PersonSignature/cat_ru:PersonPost"/>
								</td>
								<td width="5%"></td>
								<td width="30%" style="border-bottom: 1px solid black;"></td>
								<td width="5%"></td>
								<td width="30%" style="border-bottom: 1px solid black;">
									<xsl:apply-templates select="oez_ci:PersonSignature" mode="FIO"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">(резидент Арктической зоны Российской Федерации или лицо, им уполномоченное)</td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div class="descr" style="width:100%">
						<sup>1</sup> Указываются сведения о лице, которому, выдается Заключение о возможности идентификации ввозимых товаров с указанием:<br/>
							для юридического лица:<br/>
							наименование организации, основной государственный регистрационный номер (далее - ОГРН), идентификационный номер налогоплательщика (далее - ИНН) и код причины постановки на учет в налоговом органе (далее - КПП), присвоенные юридическому лицу в соответствии с законодательством Российской Федерации, адрес юридического лица в пределах места нахождения юридического лица, реквизиты свидетельства, удостоверяющего регистрацию лица в качестве резидента Арктической зоны Российской Федерации;<br/>
							для физического лица:<br/>
							фамилия, имя, отчество (при наличии), адрес регистрации по месту жительства или адрес регистрации по месту пребывания, ИНН, основной государственный регистрационный номер индивидуального предпринимателя (далее - ОГРНИП) и реквизиты свидетельства, удостоверяющего регистрацию лица в качестве резидента Арктической зоны Российской Федерации.<br/>
						<sup>2</sup> Указывается регистрационный номер уведомления о ввозе товаров, поданного в таможенный орган, который присвоен в соответствии с пунктом 14 Порядка и технологии совершения таможенных операций в отношении товаров (в том числе транспортных средств), ввозимых на участки Арктической зоны Российской Федерации, на которых применяется таможенная процедура свободной таможенной зоны, в том числе связанных с осуществлением их идентификации, и вывозимых с таких участков, утвержденного настоящим приказом.<br/>
						<sup>3</sup> Указываются сведения о резиденте Арктической зоны Российской Федерации, который осуществляет ввоз товаров на территорию участка Арктической зоны Российской Федерации, на котором применяется таможенная процедура свободной таможенной зоны, с указанием:<br/>
							наименования юридического лица (с указанием ОГРН, ИНН и КПП);<br/>
							фамилии, имени, отчества (при наличии) физического лица (с указанием ИНН, ОГРНИП).<br/>
						<sup>4</sup> Указывается порядковый номер товара, начиная с цифры 1.<br/>
						<sup>5</sup> Указывается торговое, коммерческое или иное традиционное наименование товара.<br/>
						<sup>6</sup> Указывается порядковый номер товара из уведомления о ввозе товаров.<br/>
						<sup>7</sup> Указываются способ идентификации и (или) описание средств идентификации, которые используются для идентификации ввозимых товаров.
					</div>
				</div>
			</body>
		</html>
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
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN='ИНН'">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN='ПИН'">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>, ОГРН: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>, ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>, КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа oez_ci:OrganizationType -->
	<xsl:template match="oez_ci:AuthorizedPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="oez_ci:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="oez_ci:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="oez_ci:CertificateNumber">
				<div class="title marg-top">Реквизиты свидетельства о включении в реестр резидентов Арктической зоны</div>
				<div>
					<xsl:apply-templates select="oez_ci:CertificateNumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="oez_ci:CertificateNumber">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа oez_ci:RegNumType -->
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'AbbrDoc']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'AbbrDoc']"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="oez_ci:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="*" mode="FIO">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<!-- Шаблон для типа oez_ci:GoodsListType -->
	<xsl:template match="oez_ci:GoodsList">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="oez_ci:Position"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="oez_ci:GoodsDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="oez_ci:NoticeSequenceNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="oez_ci:IdentificationMethod">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="oez_ci:Comment">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа oez_ci:OrganizationType -->
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="oez_ci:Address">
			<xsl:text>, адрес: </xsl:text>
			<xsl:apply-templates select="oez_ci:Address" mode="address"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:if test="oez_ci:CertificateNumber">
			<xsl:text>, свидетельство: </xsl:text>
			<xsl:apply-templates select="oez_ci:CertificateNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="org_short">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='OEZ_ConclusionIdentif']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
