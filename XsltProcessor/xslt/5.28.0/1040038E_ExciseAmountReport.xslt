<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" 
	xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" 
	xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.27.0" 
	xmlns:ear="urn:customs.ru:Information:ELSDocuments:ExciseAmountReport:5.28.0" 
	xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="NsiValues"/>
	<!-- Шаблон для типа ExciseAmountReportType -->
	<xsl:template match="ear:ExciseAmountReport">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Отчет об объемах ввезенных в Российскую Федерацию сигарет и (или) папирос, и (или) сигарилл, и (или) биди, и (или) кретека</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ear:ReportDocument">
						<div class="title marg-top">Номер и дата отчета</div>
						<div>
							<xsl:apply-templates select="ear:ReportDocument">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ear:RegistrationDocument">
						<div class="title marg-top">Номер и дата регистрации отчета</div>
						<div>
							<xsl:apply-templates select="ear:RegistrationDocument">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ear:ConfirmationDocument">
						<div class="title marg-top">Документ-подтверждение</div>
						<div>
							<xsl:apply-templates select="ear:ConfirmationDocument">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ear:Importer">
						<div class="title marg-top">Налогоплательщик</div>
						<div>
							<xsl:apply-templates select="ear:Importer">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Отчетные данные</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер записи в отчете</td>
								<td class="graphMain bordered">Тип документа уплаты акциза (0 - ДТ, 1 - Заявление об уплате акциза, 2 - Отчетная партия)</td>
								<td class="graphMain bordered">Регистрационный номер ДТ/Заявления об уплате акциза</td>
								<td class="graphMain bordered">Порядковый номер товара в ДТ или Заявлении</td>
								<td class="graphMain bordered">ТН ВЭД</td>
								<td class="graphMain bordered">Наименование товара</td>
								<td class="graphMain bordered">Страна происхождения</td>
								<td class="graphMain bordered">Страна отправления</td>
								<td class="graphMain bordered">Единица измерения количества товара для целей применения ставки акциза</td>
								<td class="graphMain bordered">Совокупный объем ввезенных в Российскую Федерацию товаров с начала календарного месяца в натуральном выражении, кг</td>
								<td class="graphMain bordered">Совокупный объем ввезенных в Российскую Федерацию товаров с начала календарного месяца в единицах, используемых для расчета акциза</td>
								<td class="graphMain bordered">Максимальная розничная цена (для целей применения ставки акциза)</td>
								<td class="graphMain bordered">Налоговая база</td>
								<td class="graphMain bordered">Ставка акциза</td>
								<td class="graphMain bordered">Среднемесячный совокупный объем ввезенных в Российскую Федерацию товаров в предыдущем календарном году в натуральном выражении, кг</td>
								<td class="graphMain bordered">Среднемесячный совокупный объем ввезенных в Российскую Федерацию товаров в предыдущем календарном году в единицах, используемых для расчета акциза</td>
								<td class="graphMain bordered">Значение коэффициента, рассчитываемого в единицах, используемых для расчета акциза</td>
								<td class="graphMain bordered">Сумма акциза к уплате</td>
							</tr>
							<xsl:for-each select="ear:ReportInfo">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="ear:AttachedDocuments">
						<div class="title marg-top">Перечень прилагаемых документов</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Код вида электронного документа (сведений)</td>
									<td class="graphMain bordered">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</td>
								</tr>
								<xsl:for-each select="ear:AttachedDocuments">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="ear:DirSignature">
						<div class="title marg-top">Подпись руководителя</div>
						<div>
							<xsl:apply-templates select="ear:DirSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ear:MainAcnSignature">
						<div class="title marg-top">Подпись главного бухгалтера</div>
						<div>
							<xsl:apply-templates select="ear:MainAcnSignature">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="cat_ru:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
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
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
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
	<!-- Шаблон для типа ear:AttachedDocumentsType -->
	<xsl:template match="ear:AttachedDocuments">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
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
					<xsl:apply-templates select="ear:EDocCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ear:DocArchIdDetails">
						<xsl:apply-templates select="ear:DocArchIdDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:BankInformationType -->
	<xsl:template match="ear:BankAccInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер банковского счета</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:BankAccount">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Описание типа счета: расчетный, валютный</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="cat_ru:BankAccountDescription">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Название банка</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:BankName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:BankMFO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">МФО банка</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BankMFO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OKPOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код банка по ОКПО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OKPOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:BICID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">БИК банка</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BICID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SWIFTID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">SWIFT код банка</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SWIFTID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CorrAccount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер корреспондентского счета банка</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CorrAccount"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:TransitCurrencyAccount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Валютный счет организации (транзитный)</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:TransitCurrencyAccount">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Валютный счет организации (специальный транзитный)</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
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
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ear:ConfirmationDocument">
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
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="ear:DirSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
	<xsl:template match="ear:DocArchIdDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="($wdth div 2)- 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:ElectronicDocumentID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ID документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicDocumentID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ElectronicArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ID хранилища</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:DocumentModeID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:DocumentModeID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ear:OrganizationType -->
	<xsl:template match="ear:Importer">
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
			<xsl:if test="cat_ru:OKPOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OKPOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OKATOCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OKATOCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Address">
				<div class="title marg-top">Адрес </div>
				<div>
					<xsl:apply-templates select="cat_ru:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="cat_ru:Contact">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ear:BankAccInfo">
				<div class="title marg-top">Банковские реквизиты</div>
				<div>
					<xsl:apply-templates select="ear:BankAccInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="ear:MainAcnSignature">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IssueDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата подписания</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IssueDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ear:RegistrationDocument">
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
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="ear:RegistrationNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:apply-templates select="els_agr:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="els_agr:RegistrationDate" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="els_agr:DocNumber"/>
		<xsl:if test="els_agr:NumPP">
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="els_agr:NumPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="ear:ReportDocument">
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
	<!-- Шаблон для типа ear:ReportExtType -->
	<xsl:template match="ear:ReportInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ReportNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ear:DocumentType='0'">
							<xsl:text>ДТ</xsl:text>
						</xsl:when>
						<xsl:when test="ear:DocumentType='1'">
							<xsl:text>Заявление об уплате акциза</xsl:text>
						</xsl:when>
						<xsl:when test="ear:DocumentType='2'">
							<xsl:text>Отчетная партия</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ear:DocumentType"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ear:RegistrationNumber">
						<xsl:apply-templates select="ear:RegistrationNumber">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:GoodsNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:GoodsTNVED"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:GoodsDescription"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:OriginCountry"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:DepartCountry"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseMeasureUnit"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseAmountNatural" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseAmountInMeasureUnit" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:MaxPrice" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:TaxBase" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseRate"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:AvgAmountNatural" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:AvgAmountInMeasureUnit" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseCoeff" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ear:ExciseSum" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>

	<xsl:template match="ear:ExciseRate">
		<xsl:apply-templates select="ear:DutyTaxFeeRateValue"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="not(ear:RateTypeCode)">RUB</xsl:when>
			<xsl:when test="ear:RateTypeCode = '%'">%</xsl:when>
			<xsl:when test="ear:RateTypeCode = '*'">
				<xsl:choose>
					<xsl:when test="ear:RateCurrencyCode">
						<xsl:apply-templates select="ear:RateCurrencyCode" mode="currency"/>
					</xsl:when>
					<xsl:otherwise> RUB</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="ear:RateTNVEDQualifierCode">
					<xsl:text> за </xsl:text>
					<xsl:value-of select="ear:WeightingFactor"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="ear:RateTNVEDQualifierCode" mode="qualCode"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="ear:Rate3">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="ear:OperationsSign"/>
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="ear:Rate3"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(ear:RateTypeCode3)">RUB</xsl:when>
				<xsl:when test="ear:RateTypeCode3 = '%'">%</xsl:when>
				<xsl:when test="ear:RateTypeCode3 = '*'">
					<xsl:choose>
						<xsl:when test="ear:RateCurrencyCode3">
							<xsl:apply-templates select="ear:RateCurrencyCode3" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="ear:RateTNVEDQualifierCode3">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="ear:WeightingFactor3"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="ear:RateTNVEDQualifierCode3" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="ear:Rate2">
			<xsl:choose>
				<xsl:when test="ear:ComparisonOperationsSign='1' or not(ear:ComparisonOperationsSign)">, но не менее </xsl:when>
				<xsl:when test="ear:ComparisonOperationsSign='2'">, но не более </xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ear:ComparisonOperationsSign"/>
					<xsl:text> </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="ear:Rate2"/>
			<xsl:text> </xsl:text>
			<xsl:choose>
				<xsl:when test="not(ear:RateTypeCode2)">RUB</xsl:when>
				<xsl:when test="ear:RateTypeCode2 = '%'">%</xsl:when>
				<xsl:when test="ear:RateTypeCode2 = '*'">
					<xsl:choose>
						<xsl:when test="ear:RateCurrencyCode2">
							<xsl:apply-templates select="ear:RateCurrencyCode2" mode="currency"/>
						</xsl:when>
						<xsl:otherwise> RUB</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="ear:RateTNVEDQualifierCode2">
						<xsl:text> за </xsl:text>
						<xsl:value-of select="ear:WeightingFactor2"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="ear:RateTNVEDQualifierCode2" mode="qualCode"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="currency">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/VALNAME[@KOD = $val]/@BUK"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="string($val)='643'">RUB</xsl:when>
						<xsl:when test="string($val)='978'">EUR</xsl:when>
						<xsl:when test="string($val)='840'">USD</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>) </xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="qualCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		
		<element xml_node="{$xpath_date}">
			<xsl:variable name="val" select="."/>
			<xsl:choose>
				<xsl:when test="$NsiValues">
					<xsl:value-of select="$NsiValues/EDIZM[@KOD = $val]/@KRNAIM"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test=".='006'"> МЕТР</xsl:when>
						<xsl:when test=".='055'"> КВАДРАТНЫЙ МЕТР</xsl:when>
						<xsl:when test=".='111'"> КУБИЧЕСКИЙ САНТИМЕТР</xsl:when>
						<xsl:when test=".='112'"> ЛИТР</xsl:when>
						<xsl:when test=".='113'"> КУБИЧЕСКИЙ МЕТР</xsl:when>
						<xsl:when test=".='114'"> 1000 КУБИЧЕСКИХ МЕТРОВ</xsl:when>
						<xsl:when test=".='117'"> ТОННУ ПОЛНОЙ МАССЫ</xsl:when>
						<xsl:when test=".='118'"> КУБИЧЕСКИЙ МЕТР ПОЛНОГО ОБЪЕМА КУЗОВА</xsl:when>
						<xsl:when test=".='130'"> 1000 ЛИТРОВ</xsl:when>
						<xsl:when test=".='162'"> МЕТРИЧЕСКИЙ КАРАТ</xsl:when>
						<xsl:when test=".='163'"> ГРАММ</xsl:when>
						<xsl:when test=".='166'"> КИЛОГРАММ</xsl:when>
						<xsl:when test=".='168'"> ТОННУ ВЕСА НЕТТО</xsl:when>
						<xsl:when test=".='185'"> ГРУЗОПОДЪЕМНОСТЬ В ТОННАХ</xsl:when>
						<xsl:when test=".='214'"> КИЛОВАТТ</xsl:when>
						<xsl:when test=".='246'"> 1000 КИЛОВАТТ В ЧАС</xsl:when>
						<xsl:when test=".='251'"> ЛОШАДИНУЮ СИЛУ</xsl:when>
						<xsl:when test=".='305'"> КЮРИ</xsl:when>
						<xsl:when test=".='306'"> ГРАММ ДЕЛЯЩИХСЯ ИЗОТОПОВ</xsl:when>
						<xsl:when test=".='715'"> ПАРУ</xsl:when>
						<xsl:when test=".='796'"> ШТУКУ</xsl:when>
						<xsl:when test=".='797'"> СТО ШТУК</xsl:when>
						<xsl:when test=".='798'"> ТЫСЯЧУ ШТУК</xsl:when>
						<xsl:when test=".='831'"> ЛИТР ЧИСТОГО (100%) СПИРТА</xsl:when>
						<xsl:when test=".='841'"> КИЛОГРАММ ПЕРОКСИДА ВОДОРОДА</xsl:when>
						<xsl:when test=".='845'"> КИЛОГРАММ СУХОГО НА 90% ВЕЩЕСТВА</xsl:when>
						<xsl:when test=".='852'"> КИЛОГРАММ ОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='859'"> КИЛОГРАММ ГИДРОКСИДА КАЛИЯ</xsl:when>
						<xsl:when test=".='861'"> КИЛОГРАММ АЗОТА</xsl:when>
						<xsl:when test=".='863'"> КИЛОГРАММ ГИДРОКСИДА НАТРИЯ</xsl:when>
						<xsl:when test=".='865'"> КИЛОГРАММ ПЯТИОКСИДА ФОСФОРА</xsl:when>
						<xsl:when test=".='867'"> КИЛОГРАММ УРАНА</xsl:when>
						<xsl:otherwise>
							<xsl:text> (код ед.изм.: </xsl:text>
							<xsl:value-of select="."/>
							<xsl:text>)</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</element>
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ExciseAmountReport']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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