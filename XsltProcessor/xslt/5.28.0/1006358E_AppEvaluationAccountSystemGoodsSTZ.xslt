<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 27.04.2023 № 320 "Об утверждении Порядка проведения оценки системы учета товаров на соответствие положениям требований к системе учета товаров в целях идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в товарах, изготовленных (полученных) с использованием таких иностранных товаров, составления заключения по итогам проведения оценки системы учета товаров и издания распоряжения о согласовании такой системы учета". Приложение №1 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:aeasg_stz="urn:customs.ru:Information:CustomsDocuments:AppEvaluationAccountSystemGoodsSTZ:5.28.0">
  <!-- Шаблон для типа AppEvaluationAccountSystemGoodsSTZType -->
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="aeasg_stz:AppEvaluationAccountSystemGoodsSTZ">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<style type="text/css">
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.page1
					{/*width: 297mm;*/
					/*height: 297mm;*/
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.space
					{width: 30px;}

					.marg-top
					{margin-top: 5mm;}

					.marg-top2
					{margin-top: 3mm;
					font-weight: bold;}

					.spec_column
					{border-bottom: 0px; 
					border-left: 0px; 
					border-right: 0px; 
					font-size: 10pt;}

					.header
					{ont-weight: bold;}

					.docs td
					{padding: 5px}

					.goods tr td
					{vertical-align: top;
					padding: 5px;}

					.main tr td
					{vertical-align: top;}

					.content
					{margin-top:10px; 
					margin-left: 15px;
					margin-bottom: 15px;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					div.title, tr.title td
					{font-weight:bold;}

					.border
					{border: 1px solid;}

					.bordered
					{border-collapse: collapse;}

					.bordered2
					{border-bottom: 1px solid;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align: top;}

					td.graphNormal
					{vertical-align: top;}

					td.value.graphMain
					{vertical-align: bottom;}

					td.value.graphNormal
					{vertical-align: bottom;}
	
					.descr
					{font-size: 8pt;
					text-align: center;
					vertical-align: top;}

					.description
					{font-size: 8pt;
					vertical-align: top;}

					.indent
					{text-indent: 1.5em;}

					.delim_3
					{height: 3pt;}

					.graphLittle
					{font-size: 7pt;
					text-align: center;
					vertical-align: top;}

					.delim_3
					{height: 3pt;}

					.graphMain
					{font-family: Arial;
					font-size: 11pt;}

					.graphNormal
					{font-family: Arial;
					font-size: 10pt;}

					@media print
					{div.page
					{border: none;}}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="2">
										<b><xsl:text>Заявление</xsl:text><br/><xsl:text>о проведении оценки системы учета на соответствие Требованиям к системе учета товаров в целях идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в товарах, изготовленных (полученных) с использованием таких иностранных товаров, утвержденным постановлением Правительства
Российской Федерации от 13 марта 2019 г. № 264</xsl:text></b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="graphNormal">
						<tbody>
							<tr>
								<td valign="top" class="bordered" colspan="3" width="50%">
									<xsl:text>В </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:if test="aeasg_stz:Customs/cat_ru:OfficeName">
												<xsl:value-of select="aeasg_stz:Customs/cat_ru:OfficeName"/>
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="aeasg_stz:Customs/cat_ru:Code"/>
											<xsl:if test="aeasg_stz:Customs/cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа
с указанием кода)'"/>
										<xsl:with-param name="width" select="'50mm'"/>
									</xsl:call-template>
								</td>
								<td valign="top" class="bordered" colspan="3" width="50%">
									<xsl:text>Регистрационный № </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:text> </xsl:text>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'30mm'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="3" width="50%" style="font-weight: bold;">
									<xsl:text>1. Организационно-правовая форма организации</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="3" width="50%" style="font-weight: bold;">
									<xsl:text>2. Полное наименование организации</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="3" width="50%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:BusinessEntityTypeName"/>
									<xsl:text> </xsl:text>
									<xsl:if test="aeasg_stz:Organization/aeasg_stz:BusinessEntityTypeCode/RUScat_ru:UnifiedCode">
										<xsl:text>(</xsl:text>
										<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:BusinessEntityTypeCode/RUScat_ru:UnifiedCode"/>
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
								<td valign="top" class="bordered" colspan="3" width="50%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>3. Идентификационный номер налогоплательщика</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:INN"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>4. Серия, номер и дата выдачи свидетельства о постановке на учет в налоговом органе</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:text>серия - </xsl:text>
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:INNDocDetails/aeasg_stz:IdentityCardSeries"/>
									<xsl:text>, номер - </xsl:text>
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:INNDocDetails/aeasg_stz:IdentityCardNumber"/>
									<xsl:text>, дата - </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aeasg_stz:Organization/aeasg_stz:INNDocDetails/aeasg_stz:IdentityCardDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>5. Код Общероссийского классификатора предприятий и организаций</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:OKPOId"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>6. Основной государственный регистрационный номер записи о создании юридического лица в Едином государственном реестре юридических лиц</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:OGRN"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>7. Номер и дата выдачи свидетельства о внесении записи в Единый государственный реестр юридических лиц</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:text>№ </xsl:text>
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:EGRNDocDetails/cat_ru:PrDocumentNumber"/>
									<xsl:text> от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aeasg_stz:Organization/aeasg_stz:EGRNDocDetails/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>8. Место нахождения организации и адрес в пределах места нахождения</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:for-each select="aeasg_stz:Organization/aeasg_stz:AddressDetails">
										<xsl:if test="position()!=1">
											<br/>
										</xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2" rowspan="3" width="30%" style="font-weight: bold;">
									<xsl:text>9. Контактные данные</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>телефон, факс, телетайп</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>телефон: </xsl:text>
									<xsl:for-each select="aeasg_stz:Organization/aeasg_stz:CommunicationDetails/cat_ru:Phone">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
									<br/>
									<xsl:text>факс: </xsl:text>
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:CommunicationDetails/cat_ru:Fax"/>
									<br/>
									<xsl:text>телекс (телетайп): </xsl:text>
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:CommunicationDetails/cat_ru:Telex"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>адрес электронной почты</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:for-each select="aeasg_stz:Organization/aeasg_stz:CommunicationDetails/cat_ru:E_mail">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>интернет-сайт (при наличии)</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:value-of select="aeasg_stz:Organization/aeasg_stz:CommunicationDetails/aeasg_stz:WebSite"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>10. Фамилия, имя, отчество (при наличии) руководителя</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:value-of select="aeasg_stz:HeadOfOrganization/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="aeasg_stz:HeadOfOrganization/cat_ru:PersonName"/>
									<xsl:if test="aeasg_stz:HeadOfOrganization/cat_ru:PersonMiddleName">
										<xsl:text> </xsl:text>
										<xsl:value-of select="aeasg_stz:HeadOfOrganization/cat_ru:PersonMiddleName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>11. Описание производства, виды серийной продукции, производство которой осуществляется организацией</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:for-each select="aeasg_stz:DescriptionOfProduction/aeasg_stz:SerialProduction">
										<xsl:if test="position()!=1">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>12. Место нахождения производства (адрес)</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:apply-templates select="aeasg_stz:DescriptionOfProduction/aeasg_stz:ManufactureAddress"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="4" width="65%" style="font-weight: bold;">
									<xsl:text>13. Соответствие организации положениям пункта 2 постановления Правительства Российской Федерации от 13 марта 2019 г. № 264</xsl:text><sup>1</sup>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:choose>
										<xsl:when test="aeasg_stz:ConformitySign='0' or aeasg_stz:ConformitySign='false'">
											<s><xsl:text>соответствует</xsl:text></s>
											<xsl:text> / не соответствует</xsl:text>
										</xsl:when>
										<xsl:when test="aeasg_stz:ConformitySign='1' or aeasg_stz:ConformitySign='true'">
											<xsl:text>соответствует / </xsl:text>
											<s><xsl:text>не соответствует</xsl:text></s>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>14. Сведения о системе учета (программное обеспечение для ведения налогового и бухгалтерского учета в организации)</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%">
									<xsl:value-of select="aeasg_stz:AccountingSystem/aeasg_stz:AccountingSystemDescription"/>
									<br/>
									<xsl:text>Дата начала использования системы учета: </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aeasg_stz:AccountingSystem/aeasg_stz:AccountingBegDate"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="6" width="100%" style="font-weight: bold;">
									<xsl:text>15. Прилагаемые к заявлению документы</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" valign="top" class="bordered" colspan="1" width="20%">
									<xsl:text>№ п/п</xsl:text>
								</td>
								<td align="center" valign="top" class="bordered" colspan="2" width="30%">
									<xsl:text>наименование документа</xsl:text>
								</td>
								<td align="center" valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>реквизиты (номер, дата)</xsl:text>
								</td>
								<td align="center" valign="top" class="bordered" colspan="1" width="15%">
									<xsl:text>количество листов</xsl:text>
								</td>
							</tr>
							<xsl:for-each select="aeasg_stz:PresentedDoc">
								<tr>
									<td valign="top" class="bordered" colspan="1" width="20%">
										<xsl:value-of select="aeasg_stz:Position"/>
									</td>
									<td valign="top" class="bordered" colspan="2" width="30%">
										<xsl:value-of select="cat_ru:PrDocumentName"/>
									</td>
									<td valign="top" class="bordered" colspan="2" width="35%">
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>
										<xsl:text> от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
									<td valign="top" class="bordered" colspan="1" width="15%">
										<xsl:value-of select="aeasg_stz:SheetsNumber"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td valign="top" class="bordered" colspan="3" width="50%" style="font-weight: bold;">
									<xsl:text>16. Подпись руководителя организации (лица, его замещающего) или лица, уполномоченного организацией на подачу заявления</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="3" width="50%">
									<br/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2" rowspan="4" width="30%" style="font-weight: bold;">
									<xsl:text>17. Сведения о лице, подающем заявление (заполняется, если заявление подается лицом, уполномоченным организацией на подачу заявления)</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>полное наименование организации</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:value-of select="aeasg_stz:ApplicantDetails/aeasg_stz:OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:text>идентификационный номер налогоплательщика</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="2" width="35%">
									<xsl:value-of select="aeasg_stz:ApplicantDetails/aeasg_stz:INN"/>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="4" width="70%">
									<xsl:text>документ, подтверждающий полномочия лица:</xsl:text>
								</td>
							</tr>
							<tr>
								<td valign="top" class="bordered" colspan="1" width="20%">
									<xsl:text>наименование</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="1" width="15%">
									<xsl:value-of select="aeasg_stz:ApplicantDetails/aeasg_stz:ConfirmDocDetails/cat_ru:PrDocumentName"/>
								</td>
								<td valign="top" class="bordered" colspan="1" width="20%">
									<xsl:text>номер/дата</xsl:text>
								</td>
								<td valign="top" class="bordered" colspan="1" width="15%">
									<xsl:text>№ </xsl:text>
									<xsl:value-of select="aeasg_stz:ApplicantDetails/aeasg_stz:ConfirmDocDetails/cat_ru:PrDocumentNumber"/>
									<xsl:text> от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aeasg_stz:ApplicantDetails/aeasg_stz:ConfirmDocDetails/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div style="inline-block; width: 50mm;" class="value"/>
					<div class="description">
						<sup>1</sup><xsl:text> "О требованиях к системе учета товаров в целях идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в товарах, изготовленных (полученных) с использованием таких иностранных товаров, порядке ее согласования с таможенным органом и особенностях ее использования для целей таможенного контроля" (Собрание законодательства Российской Федерации, 2019, N 11, ст. 1148)</xsl:text>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="aeasg_stz:Organization/aeasg_stz:AddressDetails | aeasg_stz:DescriptionOfProduction/aeasg_stz:ManufactureAddress">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
