<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:gncwrr="urn:customs.ru:Information:ReportingCollection:GoodsNoCustomsWarehouseRepRequest:5.25.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа GoodsNoCustomsWarehouseRepRequestType -->
	<xsl:template match="gncwrr:GoodsNoCustomsWarehouseRepRequest">
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
										<b>Требование о предоставлении внеочередной отчетности лица, поместившего товары под таможенную процедуру таможенного склада и осуществляющего их хранение в местах, не являющихся таможенными складами</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="gncwrr:Customs">
						<div class="title marg-top">Таможенный орган, направивший Требование о необходимости представления внеочередной отчетности</div>
						<div>
							<xsl:apply-templates select="gncwrr:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gncwrr:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа, направившего Требование о необходимости представления внеочередной отчетности</div>
						<div>
							<xsl:apply-templates select="gncwrr:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата подписания требования</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="gncwrr:RequestDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="gncwrr:RequestNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер требования</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="gncwrr:RequestNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gncwrr:BeginReportDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата начала отчетного периода</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="gncwrr:BeginReportDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="gncwrr:EndReportDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата окончания отчетного периода</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="gncwrr:EndReportDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Срок, в течение которого необходимо представить отчетность в таможенный орган</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="gncwrr:RequestDeadline" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="gncwrr:DTNumber">
						<div class="title marg-top">Номера ДТ, по которым необходимо представление отчетности</div>
						<table class="bordered">
							<tbody>
								<xsl:for-each select="gncwrr:DTNumber">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="gncwrr:Organization">
						<div class="title marg-top">Сведения об организации / физическом лице</div>
						<div>
							<xsl:apply-templates select="gncwrr:Organization">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="gncwrr:AttachedDocuments">
						<div class="title marg-top">Приложенные документы</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Тело документа</td>
								</tr>
								<xsl:for-each select="gncwrr:AttachedDocuments">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение вида адреса: "1" - адрес регистрации; "2" - фактический адрес; "3" - почтовый адрес</td>
						<td class="value graphMain" style="width:50%">
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
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:Contact">
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
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:FullIdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocValidityDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IssuerCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IssuerCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AuthorityId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AuthorityId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа gncwrr:DocumentInfoType -->
	<xsl:template match="gncwrr:AttachedDocuments">
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
					<xsl:if test="gncwrr:DocumentBody">
						<xsl:apply-templates select="gncwrr:DocumentBody">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="gncwrr:Customs">
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
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="gncwrr:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PersonName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="gncwrr:DTNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа gncwrr:DocumentBodyType -->
	<xsl:template match="gncwrr:DocumentBody">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>

		<xsl:apply-templates select="gncwrr:FileName"/>

	</xsl:template>
	<!-- Шаблон для типа gncwrr:OrganizationInfoType -->
	<xsl:template match="gncwrr:Organization">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="RUScat_ru:OrganizationName">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:Address">
				<div class="title marg-top">Адрес организации</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Документ, удостоверяющий личность</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:Contact">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:Contact">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationFullDatas">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Полные данные по организации одной строкой (при отсутствии детализации)</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="RUScat_ru:OrganizationFullDatas">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="gncwrr:ApplicantType">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Тип заявителя (1 - юридическое лицо, 2 - индивидуальный предприниматель, 3 – физическое лицо)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="gncwrr:ApplicantType='1'">
									<xsl:text>юридическое лицо</xsl:text>
								</xsl:when>
								<xsl:when test="gncwrr:ApplicantType='2'">
									<xsl:text>индивидуальный предприниматель</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="gncwrr:ApplicantType"/>
								</xsl:otherwise>
							</xsl:choose>
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
	<xsl:template match="//*[local-name()='GoodsNoCustomsWarehouseRepRequest']//*" priority="-1">
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
