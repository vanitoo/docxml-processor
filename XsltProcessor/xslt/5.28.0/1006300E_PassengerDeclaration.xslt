<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:pas_d="urn:customs.ru:Information:CustomsDocuments:PassengerDeclaration:5.28.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- xsl:include href="SumInWords.xslt"/ -->
	<xsl:template match="pas_d:PassengerDeclaration">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									@media print {
									.more {
											 page-break-before: always;
										} 
								    }
									body {
									background: #cccccc;
									font-family: Arial;
									font-size: 10pt;
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 10mm 10mm 20mm;
									background: #ffffff;
									border: solid 1pt #000000;
									font-size: 10pt;
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

									table td, table th
									{
										padding: 2px;
									}

									table.bordered tr td
									{
									border: 1px solid black;
									}

									.graph {
									font-family: Arial;
									font-size: 11pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									.title
									{
									font-weight:bold;
									font-family: Arial;
									font-size: 11pt;
									}

									table.bordered th
									{
									border: 1px solid black;
									font-weight:bold;
									font-family: Arial;
									font-size: 9pt;
									}

									td
									{
									font-family: Arial;
									font-size: 11pt;
									}
									div.title, tr.title td
									{font-weight:bold;  
									}

									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}
									td.border-bottom
									{
									border-bottom: solid 1px windowtext;
									vertical-align:bottom;
									}
									
									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									
									.graph_under {
									font-family: Arial;
									font-size: 7pt;
									text-align: center;
									vertical-align: top;
									}
									
									.delim_3 
									{
									font-size: 3pt;
									}
									
									.hr-dashed {
										margin: 2px 0;
										padding: 0;
										height: 0;
										border: none;
										border-top: 1px dashed windowtext;
									}
			</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<xsl:text>ПАССАЖИРСКАЯ ТАМОЖЕННАЯ ДЕКЛАРАЦИЯ</xsl:text>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<td align="left" class="bordered">
								<table width="100%" cellpadding="4">
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>Заполняется лицом, достигшим 16-летнего возраста.</xsl:text>
											</i>
										</td>
									</tr>
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>В случае утвердительного ответа в соответствующем поле проставляется знак "x" или "v".</xsl:text>
											</i>
										</td>
									</tr>
									<tr>
										<td class="graph" style="text-align: justify;">
											<i>
												<xsl:text>Экземпляр оформленной пассажирской таможенной декларации сохраняется на весь период временного </xsl:text>
												<xsl:text>пребывания на таможенной территории ЕАЭС (за ее пределами) и предъявляется таможенному органу при выезде (возвращении).</xsl:text>
											</i>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<br/>
					<div class="title">
						<xsl:text>1. Сведения о декларанте:</xsl:text>
					</div>
					<table>
						<tbody>
							<tr>
								<td width="32%" class="border-bottom" align="center">
									<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonSurname"/>
								</td>
								<td width="2%">
									<br/>
								</td>
								<td width="32%" class="border-bottom" align="center">
									<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonName"/>
								</td>
								<td width="2%"/>
								<td width="32%" class="border-bottom" align="center">
									<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td class="graph_under">(фамилия)</td>
								<td/>
								<td class="graph_under">(имя)</td>
								<td/>
								<td class="graph_under">(отчество)</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pas_d:DeclarantPerson/pas_d:PersonIdCard">
										<xsl:choose>
											<xsl:when test="RUScat_ru:FullIdentityCardName">
												<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="*[contains(local-name(), 'CardName')]">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:if test="RUScat_ru:CountryCode">
											<xsl:apply-templates select="RUScat_ru:CountryCode"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
										<xsl:if test="RUScat_ru:IdentityCardSeries and RUScat_ru:IdentityCardNumber">
											<xsl:text> </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
										<xsl:if test="(RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber) and RUScat_ru:IdentityCardDate">
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:if test="RUScat_ru:IdentityCardDate">
											<xsl:text>выдан </xsl:text>
											<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
										</xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(документ, удостоверяющий личность (наименование, страна выдачи, серия, номер, дата выдачи))</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pas_d:DeclarantPerson/pas_d:Address[RUScat_ru:AddressKindCode = '1' or not(RUScat_ru:AddressKindCode)]/*[local-name() != 'AddressKindCode']">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(адрес постоянного места жительства (регистрации) <i>(заполняется при ввозе (в том числе временном) транспортного средства, ввозе или вывозе наличных денежных средств и (или) денежных инструментов, транзите)</i>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="border-bottom">
									<xsl:for-each select="pas_d:DeclarantPerson/pas_d:Address[RUScat_ru:AddressKindCode = '2']/*[local-name() != 'AddressKindCode']">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="graph_under">(адрес временного проживания (пребывания) в государстве - члене ЕАЭС <i>(заполняется иностранным лицом при ввозе (в том числе временном) транспортного средства, ввозе или вывозе наличных денежных средств и (или) денежных инструментов, транзите)</i>
								</td>
							</tr>
							<tr>
								<td colspan="5" class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<!--xsl:if test="pas_d:DeclarantPerson/pas_d:INN">
									<td class="border-bottom" align="center">
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:INN"/>
									</td>
									<td width="2%"/>
								</xsl:if-->
								<td width="48%" class="border-bottom" align="center">
									<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:CountryDeparture/RUScat_ru:CountryName"/>
								</td>
								<td width="2%"/>
								<td width="48%" class="border-bottom" align="center">
									<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:CountryDestination/RUScat_ru:CountryName"/>
								</td>
							</tr>
							<tr>
								<!--xsl:if test="pas_d:DeclarantPerson/pas_d:INN">
									<td class="graph_under">(ИНН)</td>
									<td/>
								</xsl:if-->
								<td class="graph_under">(страна отправления)</td>
								<td/>
								<td class="graph_under">(страна назначения)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="85%" class="graph">Со мной следуют лица, не достигшие 16-летнего возраста, в количестве</td>
								<td valign="top" class="border-bottom" width="5%" align="center">
									<xsl:choose>
										<xsl:when test="pas_d:MinorPersonQuantity">
											<xsl:apply-templates select="pas_d:MinorPersonQuantity"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td valign="top" width="10%" align="center" class="graph">чел.</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div class="title">
						<xsl:text>Мной, следующими со мной лицами, не достигшими 16-летнего возраста, либо в мой адрес (от меня) перемещаются следующие товары и транспортные средства:</xsl:text>
					</div>
					<div class="delim_3">
						<br/>
					</div>
					<div class="title">
						<xsl:text>2. Сведения о способе перемещения товаров и транспортных средств:</xsl:text>
					</div>
					<div class="delim_3">
						<br/>
					</div>
					<table>
						<tbody>
							<tr>
								<td valign="top">2.1.</td>
								<td valign="top" width="20%">
									<xsl:text>Сопровождаемый багаж, включая ручную кладь</xsl:text>
								</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:MovingCode[. = 1]"/>
										<xsl:with-param name="sign" select="number(pas_d:MovingCode) = 1"/>
									</xsl:call-template>
								</td>
								<td valign="top">2.2.</td>
								<td valign="top" width="20%">
									<xsl:text>Несопровождаемый багаж (багаж, следующий отдельно от въезжающего/ выезжающего лица) </xsl:text>
									<i>
										<xsl:text>(при въезде лица заполняется для учета норм ввоза товаров без уплаты платежей)</xsl:text>
									</i>
								</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:MovingCode[. = 2]"/>
										<xsl:with-param name="sign" select="number(pas_d:MovingCode) = 2"/>
									</xsl:call-template>
								</td>
								<td valign="top">2.3.</td>
								<td valign="top" width="20%">
									<xsl:text>Доставляемые в адрес (пересылаемые) товары без въезда/выезда лица</xsl:text>
								</td>
								<td valign="top" width="10%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:MovingCode[. = 3]"/>
										<xsl:with-param name="sign" select="number(pas_d:MovingCode) = 3"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title">
						<xsl:text>3. Сведения о товарах:</xsl:text>
					</div>
					<div class="delim_3">
						<br/>
					</div>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="20%" align="right">
									<xsl:text>Ввоз (свободное обращение)</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:TransferPurposeCode[. = 1]"/>
									</div>
								</td>
								<td valign="top" width="15%" align="right">
									<xsl:text>Вывоз</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:TransferPurposeCode[. = 3]"/>
									</div>
								</td>
								<td valign="top" width="20%" align="right">
									<xsl:text>Временный вывоз</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:TransferPurposeCode[. = 4]"/>
									</div>
								</td>
								<td valign="top" width="25%" align="right">
									<xsl:text>Транзит (для товаров, ввозимых со льготой)</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:TransferPurposeCode[. = 5]"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.1. Наличные денежные средства и (или) дорожные чеки свыше 10 000 S в эквиваленте (на 1 лицо), векселя, чеки (банковские чеки), ценные бумаги &lt;*&gt;</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '01']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '01']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.2. Товары, ввозимые с освобождением от уплаты таможенных пошлин, налогов (ввоз со льготой)</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '02']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '02']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.3. Товары, стоимость, вес и (или) количество которых превышают нормы ввоза без уплаты таможенных пошлин, налогов</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '03']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '03']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.4. Культурные ценности</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '04']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '04']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.5. Гражданское и служебное оружие, его основные (составные) части, патроны к нему</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '05']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '05']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.6. Наркотические средства, психотропные вещества, их прекурсоры в виде лекарственных средств</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '06']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '06']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.7. Животные, растения</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '07']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '07']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.8. Коллекционные материалы по минералогии, палеонтологии, кости ископаемых животных</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '08']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '08']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.9. Образцы биологических материалов человека</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '09']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '09']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>3.10. Другие товары, в отношении которых подлежат соблюдению запреты и ограничения и требуется представление подтверждающих документов и (или) сведений</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '10']"/>
										<xsl:with-param name="sign" select="number(count(pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsCategoryCode[text() = '10']) &gt; 0)"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="33%">
									<div class="hr-dashed"/>
								</td>
								<td width="67%"/>
							</tr>
							<tr>
								<td colspan="2">
									<xsl:text>&lt;*&gt; Необходимо заполнить приложение к пассажирской таможенной декларации.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--br/-->
				<div class="page">
					<div class="title">
						<xsl:text>4. Дополнительные сведения о товарах, в том числе указанных в графах 3.2 - 3.10:</xsl:text>
					</div>
					<div class="delim_3">
						<br/>
					</div>
					<table class="bordered">
						<tbody>
							<tr>
								<th width="5%" class="bordered" align="center" valign="top">
									<xsl:text>№ п/п</xsl:text>
								</th>
								<th width="50%" class="bordered" align="center" valign="top">
									<xsl:text>Наименование товара и его описание (идентификационный номер и другие отличительные признаки), </xsl:text>
									<xsl:text>наименования, даты и номера документа, подтверждающего соблюдение условий ввоза с освобождением от </xsl:text>
									<xsl:text>уплаты таможенных пошлин, налогов, и (или) документа, подтверждающего соблюдение ограничений, </xsl:text>
									<xsl:text>а также наименования органов, выдавших такие документы</xsl:text>
								</th>
								<th width="25%" class="bordered" align="center" valign="top">
									<xsl:text>Вес (с учетом фактически перемещаемой первичной упаковки) (кг)/количество (л, шт.)</xsl:text>
								</th>
								<th width="20%" class="bordered" align="center" valign="top">
									<xsl:text>Стоимость (в валюте государства - члена ЕАЭС, евро или долларах США)</xsl:text>
								</th>
							</tr>
							<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:PassDeclGoodsInfo/pas_d:GoodsListDetails/pas_d:PassDeclGoods">
								<tr>
									<td class="bordered" align="center" valign="top">
										<xsl:apply-templates select="pas_d:GoodsNumeric"/>
									</td>
									<td class="bordered" valign="top">
										<xsl:apply-templates select="pas_d:GoodsDescription"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:TradeMark"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:GoodsMark"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:GoodsModel"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:GoodsMarking"/>
										<xsl:if test="pas_d:GoodsTNVEDCode">
											<br/>
											<xsl:text>Код ТН ВЭД </xsl:text>
											<xsl:apply-templates select="pas_d:GoodsTNVEDCode"/>
										</xsl:if>
										<br/>
										<xsl:for-each select="pas_d:PresentedDocuments">
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:if>
											<br/>
											<xsl:apply-templates select="pas_d:AuthorityName"/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered" valign="top" align="left" style="padding: 5px;">
										<xsl:if test="pas_d:GrossWeightQuantity/catESAD_cu:MeasuredAmount">
											<xsl:text>брутто: </xsl:text>
											<xsl:apply-templates select="pas_d:GrossWeightQuantity/catESAD_cu:MeasuredAmount"/>
											<xsl:text> кг</xsl:text>
										</xsl:if>
										<xsl:if test="pas_d:GrossWeightQuantity and pas_d:GoodsQuantity"> / </xsl:if>
										<xsl:apply-templates select="pas_d:GoodsQuantity/catESAD_cu:MeasuredAmount"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:GoodsQuantity/catESAD_cu:MeasureUnitQualifierName"/>
										<xsl:if test="(pas_d:GrossWeightQuantity or pas_d:GoodsQuantity) and pas_d:NetWeightQuantity">
											<br/>
										</xsl:if>
										<xsl:if test="pas_d:NetWeightQuantity">
											<xsl:text>нетто: </xsl:text>
											<xsl:apply-templates select="pas_d:NetWeightQuantity/catESAD_cu:MeasuredAmount"/>
											<xsl:text> кг</xsl:text>
										</xsl:if>
									</td>
									<td class="bordered" valign="top" align="center">
										<xsl:apply-templates select="pas_d:GoodsCost/RUScat_ru:Amount" mode="numberAmount"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:GoodsCost/RUScat_ru:CurrencyCode"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div class="title">
						<xsl:text>5. Сведения о транспортных средствах:</xsl:text>
					</div>
					<div class="delim_3">
						<br/>
					</div>
					<table>
						<tbody>
							<tr>
								<td valign="top" width="16%" align="right">
									<xsl:text>Ввоз (свободное обращение)</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransferPurposeCode[. = 1]"/>
									</div>
								</td>
								<td valign="top" width="17%" align="right">
									<xsl:text>Временный ввоз</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransferPurposeCode[. = 2]"/>
									</div>
								</td>
								<td valign="top" width="12%" align="right">
									<xsl:text>Вывоз</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransferPurposeCode[. = 3]"/>
									</div>
								</td>
								<td valign="top" width="17%" align="right">
									<xsl:text>Временный вывоз</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransferPurposeCode[. = 4]"/>
									</div>
								</td>
								<td valign="top" width="13%" align="right">
									<xsl:text>Транзит</xsl:text>
								</td>
								<td valign="top" width="5%" align="center">
									<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransferPurposeCode[. = 5]"/>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Транспортные средства, ввозимые с освобождением от уплаты таможенных пошлин, налогов (ввоз со льготой)</xsl:text>
								</td>
								<td width="20%">
									<xsl:call-template name="yesno">
										<xsl:with-param name="context" select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TaxFreeIndicator"/>
										<xsl:with-param name="sign" select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TaxFreeIndicator"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:choose>
						<xsl:when test="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='30' or pas_d:TransportModeCode='99' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and not(pas_d:TransportGrossMass))]">
							<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='30' or pas_d:TransportModeCode='99' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and not(pas_d:TransportGrossMass))]">
								<xsl:if test="position() != 1">
									<br/>
								</xsl:if>
								<xsl:call-template name="Auto">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Auto">
								<xsl:with-param name="node" select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='30' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and not(pas_d:TransportGrossMass))]"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='10' or pas_d:TransportModeCode='80' or (pas_d:TransportModeCode='90' and pas_d:LengthMeasure)]">
							<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='10' or pas_d:TransportModeCode='80' or (pas_d:TransportModeCode='90' and pas_d:LengthMeasure)]">
								<xsl:if test="position() != 1">
									<br/>
								</xsl:if>
								<xsl:call-template name="Aqua">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Aqua">
								<xsl:with-param name="node" select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='10' or pas_d:TransportModeCode='80' or (pas_d:TransportModeCode='90' and pas_d:LengthMeasure)]"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='40' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and pas_d:TransportGrossMass)]">
							<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='40' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and pas_d:TransportGrossMass)]">
								<xsl:if test="position() != 1">
									<br/>
								</xsl:if>
								<xsl:call-template name="Avia">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Avia">
								<xsl:with-param name="node" select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:TransportMeansDetails[pas_d:TransportModeCode='40' or (pas_d:TransportModeCode='90' and not(pas_d:LengthMeasure) and pas_d:TransportGrossMass)]"/> 
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<table>
						<tbody>
							<tr>
								<td colspan="2" align="left" valign="bottom" style="text-align: justify;">
									<xsl:text>Часть транспортного средства, замененная в государстве, не являющемся </xsl:text>
									<xsl:text>членом ЕАЭС, и подлежащая учету (регистрации)</xsl:text>
								</td>
							</tr>
							<tr>
								<td width="99%" class="border-bottom" align="left">
									<xsl:if test="not(pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:SharePartItemDetails)">
										<br/>
									</xsl:if>
									<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:TransportMeans/pas_d:SharePartItemDetails">
										<xsl:if test="position()!=1">; </xsl:if>
										<xsl:apply-templates select="pas_d:Description"/>
										<xsl:text>, </xsl:text>
										<xsl:apply-templates select="pas_d:ProductId"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="graph_under">(наименование, номер)</td>
							</tr>
							<tr>
								<td colspan="2" class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify;">
									<xsl:text>Мне известно, что сообщение в пассажирской таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с </xsl:text>
									<xsl:text>законодательством государства - члена ЕАЭС.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="pas_d:FilledPerson">
						<xsl:with-param name="SignatoryRepresentativeDetails" select="pas_d:SignatoryRepresentativeDetails"/>
					</xsl:apply-templates>
					<br/>
					<div class="hr-dashed"/>
					<table>
						<tbody>
							<tr>
								<td width="30%" align="left">
									<xsl:text>Для служебных отметок:</xsl:text>
									<div class="delim_3">
										<br/>
									</div>
								</td>
								<td width="3%"/>
								<td width="67%"/>
							</tr>
							<tr>
								<td align="right" valign="top">
									<div style="width:30mm;height:30mm;border:1px solid;"/>
									<div class="delim_3">
										<br/>
									</div>
									<div style="width:30mm;text-align: center;">
										<xsl:text>М.П.</xsl:text>
									</div>
								</td>
								<td/>
								<td valign="top">
									<table style="table-layout: fixed;">
										<tbody>
											<tr>
												<td class="border-bottom" style="word-break: break-all;">
													<xsl:apply-templates select="pas_d:CustomsMark/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="pas_d:CustomsMark/cat_ru:LNP"/>
													<xsl:if test="not(pas_d:CustomsMark/cat_ru:PersonName) and not(pas_d:CustomsMark/cat_ru:LNP)">
														<br/>
													</xsl:if>
												</td>
											</tr>
											<xsl:choose>
												<xsl:when test="pas_d:CustomsMark/pas_d:Mark">
													<xsl:for-each select="pas_d:CustomsMark/pas_d:Mark">
														<tr>
															<td class="border-bottom" style="word-break: break-all;">
																<xsl:apply-templates select="."/>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="border-bottom">
															<br/>
														</td>
													</tr>
													<tr>
														<td class="border-bottom">
															<br/>
														</td>
													</tr>
													<tr>
														<td class="border-bottom">
															<br/>
														</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo">
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td width="35%"/>
									<td width="65%" align="right">
										<xsl:text>Приложение к пассажирской таможенной декларации</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td/>
									<td class="border-bottom" align="center">
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:PersonMiddleName"/>
										<br/>
									</td>
								</tr>
								<tr>
									<td/>
									<td class="graph_under">(фамилия, имя, отчество декларанта)</td>
								</tr>
								<tr>
									<td colspan="2" class="delim_3">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="title">
							<xsl:text>1. Дополнительные сведения о декларанте:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<tr>
									<td width="3%" class="border-bottom">
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:BirthDate" mode="date_part">
											<xsl:with-param name="start" select="number('9')"/>
											<xsl:with-param name="length" select="number('2')"/>
										</xsl:apply-templates>
									</td>
									<td width="1%" align="center" valign="bottom">
										<xsl:text>/</xsl:text>
									</td>
									<td width="3%" class="border-bottom">
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:BirthDate" mode="date_part">
											<xsl:with-param name="start" select="number('6')"/>
											<xsl:with-param name="length" select="number('2')"/>
										</xsl:apply-templates>
									</td>
									<td width="1%" align="center" valign="bottom">
										<xsl:text>/</xsl:text>
									</td>
									<td width="5%" class="border-bottom">
										<xsl:apply-templates select="pas_d:DeclarantPerson/pas_d:BirthDate" mode="date_part">
											<xsl:with-param name="start" select="number('1')"/>
											<xsl:with-param name="length" select="number('4')"/>
										</xsl:apply-templates>
									</td>
									<td width="3%">
										<br/>
									</td>
									<td width="84%" class="border-bottom">
										<xsl:for-each select="pas_d:DeclarantPerson/pas_d:RegDocumentReference/*">
											<xsl:choose>
												<xsl:when test="contains(local-name(.),'Date')">
													<xsl:apply-templates select="." mode="russian_date"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:apply-templates select="."/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph_under" colspan="5">(дата рождения)</td>
									<td/>
									<td class="graph_under">
										<xsl:text>(номер и дата выдачи визы (реквизиты документа, подтверждающего право иностранного гражданина или </xsl:text>
										<xsl:text>лица без гражданства на пребывание (проживание) на территории государства - члена ЕАЭС)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title">
							<xsl:text>2. Сведения о наличных денежных средствах и (или) денежных инструментах:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title">
							<xsl:text>2.1. Наличные денежные средства и дорожные чеки:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table class="bordered">
							<tbody>
								<tr>
									<th width="33%" align="center">Наличные денежные средства, дорожные чеки</th>
									<th width="33%" align="center">Сумма</th>
									<th width="33%" align="center">Наименование валюты</th>
								</tr>
								<xsl:variable name="notescoins">
									<xsl:choose>
										<xsl:when test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:CashDetails">
											<xsl:value-of select="count(pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:CashDetails)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td>
										<xsl:attribute name="rowspan"><xsl:value-of select="$notescoins"/></xsl:attribute>
										<xsl:text>Банкноты, казначейские билеты, монеты</xsl:text>
									</td>
									<td>
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:CashDetails[1]/RUScat_ru:Amount" mode="translate_number"/>
									</td>
									<td>
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:CashDetails[1]/RUScat_ru:CurrencyCode"/>
									</td>
								</tr>
								<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:CashDetails[position() &gt; 1]">
									<tr>
										<td>
											<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
										</td>
										<td>
											<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="checks">
									<xsl:choose>
										<xsl:when test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:TravelersChequeDetails">
											<xsl:value-of select="count(pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:TravelersChequeDetails)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td>
										<xsl:attribute name="rowspan"><xsl:value-of select="$checks"/></xsl:attribute>
										<xsl:text>Дорожные чеки</xsl:text>
									</td>
									<td>
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:TravelersChequeDetails[1]/RUScat_ru:Amount" mode="translate_number"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:TravelersChequeDetails[1]/RUScat_ru:CurrencyCode"/>
									</td>
								</tr>
								<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:TravelersChequeDetails[position() &gt; 1]">
									<tr>
										<td>
											<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
										</td>
										<td>
											<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title" style="text-align: justify;">
							<xsl:text>2.2.  Денежные  инструменты,  за  исключением дорожных чеков (векселя, чеки (банковские чеки), ценные бумаги):</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table class="bordered">
							<tbody>
								<tr valign="top" align="center">
									<th>Наименование денежного инструмента</th>
									<th>Наименование эмитента (кем выпущен денежный инструмент)</th>
									<th>Дата выпуска</th>
									<th>Идентифици- рующий номер (при наличии)</th>
									<th>Номинальная стоимость или сумма (в валюте государства - члена ЕАЭС или иностранной валюте), наименование валюты</th>
									<th>Количество (заполняется при отсутствии номинальной стоимости и невозможности определить сумму)</th>
								</tr>
								<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:MonetaryInstrumentsDetails">
									<tr valign="top">
										<td>
											<xsl:apply-templates select="pas_d:MonetaryInstrumentName"/>
										</td>
										<td>
											<xsl:apply-templates select="pas_d:Issuer"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="pas_d:DateReleased" mode="russian_date"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="pas_d:NegotiableInstrumentId">
												<xsl:if test="position() !=1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
										<td>
											<xsl:apply-templates select="pas_d:Amount/RUScat_ru:Amount" mode="translate_number"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="pas_d:Amount/RUScat_ru:CurrencyCode"/>
										</td>
										<td align="center">
											<xsl:apply-templates select="pas_d:Quantity"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title" style="text-align: justify;">
							<xsl:text>3. Сведения   о  владельце  наличных  денежных  средств  и  (или)  денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<div style="text-align: justify;">
							<xsl:text>(заполняется в случае, если декларант не является собственником)</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table class="bordered">
							<tbody>
								<tr valign="top" align="center">
									<th>
										<xsl:text>Фамилия, имя, отчество (при наличии) физического лица, в том числе индивидуального предпринимателя, зарегистрированного </xsl:text>
										<xsl:text>в соответствии с законодательством государства - члена ЕАЭС, или наименование юридического лица</xsl:text>
									</th>
									<th>
										<xsl:text>Адрес места жительства физического лица, в том числе индивидуального предпринимателя, зарегистрированного в </xsl:text>
										<xsl:text>соответствии с законодательством государства - члена ЕАЭС, или место нахождения юридического лица</xsl:text>
									</th>
									<th>
										<xsl:text>Сумма, номинальная стоимость наличных денежных средств и (или) денежных инструментов, наименование валюты и (или) </xsl:text>
										<xsl:text>количество и наименование денежных инструментов</xsl:text>
									</th>
								</tr>
								<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OwnerMoney">
									<tr valign="top">
										<td>
											<xsl:apply-templates select="pas_d:OwnerMoneyName"/>
										</td>
										<td>
											<xsl:for-each select="pas_d:OwnerMoneyAddress/*">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
										</td>
										<td>
											<xsl:for-each select="pas_d:Amount">
												<xsl:apply-templates select="RUScat_ru:Amount" mode="translate_number"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="RUScat_ru:CurrencyCode"/>
											</xsl:for-each>
											<xsl:if test="pas_d:Quantity">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="pas_d:Quantity"/>
												<xsl:text> шт. </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="pas_d:MonetaryInstrumentName"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title" style="text-align: justify;">
							<xsl:text>4. Сведения об источнике происхождения наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="20%" align="right">
										<xsl:text>Заработная плата, доходы от предпринимательской деятельности физического лица</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '01']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '01']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="21%" align="right">
										<xsl:text>Дивиденды и другие доходы от участия в уставном (акционерном и т.п.) капитале организаций</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '02']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '02']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="18%" align="right">
										<xsl:text>Доходы от реализации движимого и (или) недвижимого имущества</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '03']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '03']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="21%" align="right">
										<xsl:text>Безвозмездные трансферты, полученные от физических и (или) юридических лиц (материальная помощь, гранты и т.п.)</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '04']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '04']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8">
										<br/>
									</td>
								</tr>
								<tr>
									<td valign="top" align="right">
										<xsl:text>Пенсия, стипендия, социальные пособия, алименты</xsl:text>
									</td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '05']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '05']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" align="right">
										<xsl:text>Доходы от аренды недвижимости и земельных участков</xsl:text>
									</td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '06']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '06']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" align="right">
										<xsl:text>Заемные средства</xsl:text>
									</td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '07']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '07']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" align="right">
										<xsl:text>Наследство</xsl:text>
									</td>
									<td valign="top" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyKind[. = '08']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '08']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8">
										<br/>
									</td>
								</tr>
								<tr valign="top">
									<td valign="top" align="left">
										<xsl:text>Прочее (указать)</xsl:text>
									</td>
									<td colspan="7" class="border-bottom">
										<xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney[pas_d:OriginMoneyKind = '99']">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:OriginMoney/pas_d:OriginMoneyOther"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title" style="text-align: justify;">
							<xsl:text>5. Сведения о предполагаемом использовании наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="20%" align="right">
										<xsl:text>Текущие расходы (приобретение товаров и услуг)</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney/pas_d:IntendedUseMoneyKind[. ='01']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney[pas_d:IntendedUseMoneyKind='01']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="19%" align="right">
										<xsl:text>Инвестиции, включая приобретение недвижимости</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney/pas_d:IntendedUseMoneyKind[. ='02']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney[pas_d:IntendedUseMoneyKind='02']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="22%" align="right">
										<xsl:text>Безвозмездные трансферты в пользу физических лиц (материальная помощь и т.п.)</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney/pas_d:IntendedUseMoneyKind[. ='03']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney[pas_d:IntendedUseMoneyKind='03']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
									<td valign="top" width="19%" align="right">
										<xsl:text>Безвозмездные трансферты в пользу юридических лиц (благотворительность, пожертвования и т.п.)</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney/pas_d:IntendedUseMoneyKind[. ='04']" mode="moneyKind"/>
											<!--xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney[pas_d:IntendedUseMoneyKind='04']">
												<b>X</b>
											</xsl:if-->
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8">
										<br/>
									</td>
								</tr>
								<tr valign="top">
									<td colspan="2" valign="top" align="left">
										<xsl:text>Прочее (указать)</xsl:text>
									</td>
									<td colspan="6" class="border-bottom">
										<xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney[pas_d:IntendedUseMoneyKind='99']">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:IntendedUseMoney/pas_d:IntendedUseMoneyOther"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<div class="title" style="text-align: justify;">
							<xsl:text>6.  Сведения  о  маршруте  и  способе перевозки наличных денежных средств и (или) денежных инструментов:</xsl:text>
						</div>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<xsl:variable name="maxItineraryPoint">
									<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:ItineraryPointDetails">
										<xsl:sort select="./pas_d:ObjectOrdinal" data-type="number" order="descending"/>
										<xsl:if test="position() = 1">
											<xsl:apply-templates select="pas_d:ObjectOrdinal"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<tr>
									<td width="48%" class="border-bottom" align="center">
										<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:ItineraryPointDetails[pas_d:ObjectOrdinal = 1]">
											<xsl:apply-templates select="pas_d:CountryCode"/>
											<xsl:if test="pas_d:Date">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="pas_d:Date" mode="russian_date"/>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td width="4%">
										<br/>
									</td>
									<td width="48%" class="border-bottom" align="center">
										<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:ItineraryPointDetails[pas_d:ObjectOrdinal = $maxItineraryPoint]">
											<xsl:apply-templates select="pas_d:CountryCode"/>
											<xsl:if test="pas_d:Date">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="pas_d:Date" mode="russian_date"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph_under">(страна отправления, дата выезда)</td>
									<td/>
									<td class="graph_under">(страна назначения, дата въезда)</td>
								</tr>
								<tr>
									<td colspan="3" class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="border-bottom">
										<xsl:for-each select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:ItineraryPointDetails[(pas_d:ObjectOrdinal &gt; 1) and (pas_d:ObjectOrdinal &lt; $maxItineraryPoint)]">
											<xsl:sort select="./pas_d:ObjectOrdinal" data-type="number" order="ascending"/>
											<xsl:if test="position() != 1">; </xsl:if>
											<xsl:apply-templates select="pas_d:CountryCode"/>
											<xsl:if test="pas_d:Date">
												<xsl:text>, </xsl:text>
												<xsl:apply-templates select="pas_d:Date" mode="russian_date"/>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="graph_under">(страны транзита)</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<tr>
									<td valign="bottom" style="text-align: justify;">
										<xsl:text>Вид транспорта, которым осуществляется ввоз на таможенную территорию ЕАЭС или  вывоз  с  таможенной территории ЕАЭС </xsl:text>
										<xsl:text>наличных денежных средств и (или) денежных инструментов:</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="delim_3">
							<br/>
						</div>
						<table>
							<tbody>
								<tr>
									<td valign="top" width="17%" align="right">
										<xsl:text>воздушный</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:TransportModeCode[. = '40']" mode="check"/>
										</div>
									</td>
									<td valign="top" width="23%" align="right">
										<xsl:text>автомобильный</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:TransportModeCode[. = '30']" mode="check"/>
										</div>
									</td>
									<td valign="top" width="25%" align="right">
										<xsl:text>железнодорожный</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:TransportModeCode[. = '20']" mode="check"/>
										</div>
									</td>
									<td valign="top" width="15%" align="right">
										<xsl:text>водный</xsl:text>
									</td>
									<td valign="top" width="5%" align="center">
										<div style="display:inline-block;border:1px solid; width:4mm; height:4mm;">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:TransportModeCode[. = '10']" mode="check"/>
										</div>
									</td>
								</tr>
								<tr>
									<td class="delim_3" colspan="8">
										<br/>
									</td>
								</tr>
								<tr valign="top">
									<td colspan="2" valign="top" align="left">
										<xsl:text>Прочее (указать)</xsl:text>
									</td>
									<td colspan="6" class="border-bottom" align="center">
										<xsl:if test="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:TransportModeCode = '99'">
											<xsl:apply-templates select="pas_d:GoodsShipmentDetails/pas_d:MovementCurrencyValuesInfo/pas_d:RouteMoney/pas_d:Description"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>Мне известно, что сообщение в пассажирской таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с </xsl:text>
										<xsl:text>законодательством государства - члена ЕАЭС.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:apply-templates select="pas_d:FilledPerson">
							<xsl:with-param name="SignatoryRepresentativeDetails" select="pas_d:SignatoryRepresentativeDetails"/>
						</xsl:apply-templates>
						<br/>
						<div class="hr-dashed"/>
						<table>
							<tbody>
								<tr>
									<td width="30%" align="left">
										<xsl:text>Для служебных отметок:</xsl:text>
										<div class="delim_3">
											<br/>
										</div>
									</td>
									<td width="3%"/>
									<td width="67%"/>
								</tr>
								<tr>
									<td align="right" valign="top">
										<div style="width:30mm;height:30mm;border:1px solid;"/>
										<div class="delim_3">
											<br/>
										</div>
										<div style="width:30mm;text-align: center;">
											<xsl:text>М.П.</xsl:text>
										</div>
									</td>
									<td/>
									<td valign="top">
										<table style="table-layout: fixed;">
											<tbody>
												<tr>
													<td class="border-bottom" style="word-break: break-all;">
														<xsl:apply-templates select="pas_d:CustomsMark/cat_ru:PersonName"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="pas_d:CustomsMark/cat_ru:LNP"/>
														<xsl:if test="not(pas_d:CustomsMark/cat_ru:PersonName) and not(pas_d:CustomsMark/cat_ru:LNP)">
															<br/>
														</xsl:if>
													</td>
												</tr>
												<xsl:choose>
													<xsl:when test="pas_d:CustomsMark/pas_d:Mark">
														<xsl:for-each select="pas_d:CustomsMark/pas_d:Mark">
															<tr>
																<td class="border-bottom" style="word-break: break-all;">
																	<xsl:apply-templates select="."/>
																</td>
															</tr>
														</xsl:for-each>
													</xsl:when>
													<xsl:otherwise>
														<tr>
															<td class="border-bottom">
																<br/>
															</td>
														</tr>
														<tr>
															<td class="border-bottom">
																<br/>
															</td>
														</tr>
														<tr>
															<td class="border-bottom">
																<br/>
															</td>
														</tr>
													</xsl:otherwise>
												</xsl:choose>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="pas_d:TransportModeCode" mode="check">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<b>X</b>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="moneyKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<b>X</b>
		</element>
	</xsl:template>
	<xsl:template match="RUScat_ru:Amount" mode="numberAmount">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(translate(format-number(., '#,##0.00'),',',' '),'.',',')"/>
		</element>
	</xsl:template>
	<xsl:template match="pas_d:TransferPurposeCode">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
				<b>X</b>
		</element>
	</xsl:template>
	<xsl:template name="Auto">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="35%" align="left">
						<xsl:text>Авто- и мототранспортное средство</xsl:text>
					</td>
					<td width="5%">
						<xsl:variable name="FirstAuto">
							<xsl:choose>
								<xsl:when test="local-name($node[1]) != 'PassengerDeclaration' and (not($node/pas_d:TrailerIndicator) or translate($node/pas_d:TrailerIndicator, 'FALSE', 'false') = 'false' or $node/pas_d:TrailerIndicator = 0)">true</xsl:when>
								<xsl:otherwise>false</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:call-template name="yesno">
							<xsl:with-param name="context" select="$node[1]"/>
							<xsl:with-param name="sign" select="$FirstAuto"/>
						</xsl:call-template>
					</td>
					<td width="15%" align="right">
						<xsl:text>Прицеп</xsl:text>
					</td>
					<td width="5%">
						<xsl:call-template name="yesno">
							<xsl:with-param name="context" select="$node/pas_d:TrailerIndicator"/>
							<xsl:with-param name="sign" select="$node/pas_d:TrailerIndicator"/>
						</xsl:call-template>
					</td>
					<td width="40%"/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table>
			<tbody>
				<tr>
					<td width="30%" class="border-bottom" align="center">
						<xsl:for-each select="$node">
							<!--xsl:apply-templates select="pas_d:MarkCode"/>
							<xsl:if test="pas_d:Mark or pas_d:TransportKindName or pas_d:TransportModeCode">
								<xsl:text>, </xsl:text>
							</xsl:if-->
							<xsl:apply-templates select="pas_d:Mark"/>
							<xsl:if test="pas_d:Model">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="pas_d:Model"/>
							<!--xsl:if test="pas_d:TransportKindName or pas_d:TransportKindCode">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="pas_d:TransportModeCode"/>
							<xsl:if test="pas_d:TransportKindName">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="pas_d:TransportKindName"/-->
						</xsl:for-each>
					</td>
					<td width="2%">
						<br/>
					</td>
					<td width="24%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportMeansRegId"/>
						<xsl:if test="$node/pas_d:TransportMeansRegId and $node/pas_d:TransportMeansCountryCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:TransportMeansCountryCode"/>
					</td>
					<td width="2%"/>
					<td width="24%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:VINID"/>
					</td>
					<td width="2%"/>
					<td width="16%" class="border-bottom" align="center">
						<xsl:choose>
							<xsl:when test="$node/pas_d:EngineVolumeQuanity">
								<xsl:apply-templates select="$node/pas_d:EngineVolumeQuanity/catESAD_cu:MeasuredAmount"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="$node"><!-- не должно отображаться при отсутствии данных для узла Авто -->
									ОТСУТСТВУЕТ
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td class="graph_under">(марка, модель)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(идентификационный номер)</td>
					<td/>
					<td class="graph_under">(рабочий объем двигателя (см3))</td>
				</tr>
				<tr>
					<td colspan="7" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tbody>
				<tr>
					<td width="23%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:BodyID"/>
					</td>
					<td width="2%">
						<br/>
					</td>
					<td width="24%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:ChassisID"/>
					</td>
					<td width="2%"/>
					<td width="24%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:OfftakeYear" mode="russian_date"/>
					</td>
					<td width="2%"/>
					<td width="23%" class="border-bottom" align="center">
						<xsl:if test="$node/pas_d:CustCost/RUScat_ru:Amount">
							<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:Amount" mode="translate_number"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:CurrencyCode"/>
					</td>
				</tr>
				<tr>
					<td class="graph_under">(номер кузова)</td>
					<td/>
					<td class="graph_under">(номер шасси)</td>
					<td/>
					<td class="graph_under">(дата изготовления)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
				</tr>
				<tr>
					<td colspan="7" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Aqua">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="17%" align="left" valign="bottom">
						<xsl:text>Водное судно</xsl:text>
					</td>
					<td width="2%">
						<br/>
					</td>
					<td width="8%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportModeCode"/>
					</td>
					<td width="2%"/>
					<td width="23%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportMeansRegId"/>
						<xsl:if test="$node/pas_d:TransportMeansRegId and $node/pas_d:TransportMeansCountryCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:TransportMeansCountryCode"/>
					</td>
					<td width="2%"/>
					<td width="18%" class="border-bottom" align="center">
						<xsl:if test="$node/pas_d:CustCost/RUScat_ru:Amount">
							<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:Amount" mode="translate_number"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:CurrencyCode"/>
					</td>
					<td width="2%"/>
					<td width="12%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportGrossMass/catESAD_cu:MeasuredAmount"/>
					</td>
					<td width="2%"/>
					<td width="12%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:LengthMeasure/catESAD_cu:MeasuredAmount"/>
					</td>
				</tr>
				<tr>
					<td/>
					<td/>
					<td class="graph_under">(вид)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
					<td/>
					<td class="graph_under">(масса (кг))</td>
					<td/>
					<td class="graph_under">(длина корпуса (м))</td>
				</tr>
				<tr>
					<td colspan="11" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="Avia">
		<xsl:param name="node" select="."/>
		<table>
			<tbody>
				<tr>
					<td width="22%" align="left" valign="bottom">
						<xsl:text>Воздушное судно</xsl:text>
					</td>
					<td width="2%">
						<br/>
					</td>
					<td width="8%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportModeCode"/>
					</td>
					<td width="2%"/>
					<td width="25%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportMeansRegId"/>
						<xsl:if test="$node/pas_d:TransportMeansRegId and $node/pas_d:TransportMeansCountryCode">
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:TransportMeansCountryCode"/>
					</td>
					<td width="2%"/>
					<td width="22%" class="border-bottom" align="center">
						<xsl:if test="$node/pas_d:CustCost/RUScat_ru:Amount">
							<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:Amount" mode="translate_number"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="$node/pas_d:CustCost/RUScat_ru:CurrencyCode"/>
					</td>
					<td width="2%"/>
					<td width="15%" class="border-bottom" align="center">
						<xsl:apply-templates select="$node/pas_d:TransportGrossMass/catESAD_cu:MeasuredAmount"/>
					</td>
				</tr>
				<tr>
					<td/>
					<td/>
					<td class="graph_under">(вид)</td>
					<td/>
					<td class="graph_under">(регистрационный номер, страна регистрации)</td>
					<td/>
					<td class="graph_under">(стоимость)</td>
					<td/>
					<td class="graph_under">(масса пустого снаряженного аппарата (кг))</td>
				</tr>
				<tr>
					<td colspan="9" class="delim_3">
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pas_d:FilledPerson">
		<xsl:param name="SignatoryRepresentativeDetails"/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="3%" class="border-bottom">
						<xsl:apply-templates select="RUDECLcat:SigningDetails/RUScat_ru:SigningDate" mode="date_part">
							<xsl:with-param name="start" select="number('9')"/>
							<xsl:with-param name="length" select="number('2')"/>
						</xsl:apply-templates>
					</td>
					<td width="1%" align="center" valign="bottom">
						<xsl:text>/</xsl:text>
					</td>
					<td width="3%" class="border-bottom">
						<xsl:apply-templates select="RUDECLcat:SigningDetails/RUScat_ru:SigningDate" mode="date_part">
							<xsl:with-param name="start" select="number('6')"/>
							<xsl:with-param name="length" select="number('2')"/>
						</xsl:apply-templates>
					</td>
					<td width="1%" align="center" valign="bottom">
						<xsl:text>/</xsl:text>
					</td>
					<td width="3%" class="border-bottom">
						<xsl:apply-templates select="RUDECLcat:SigningDetails/RUScat_ru:SigningDate" mode="date_part">
							<xsl:with-param name="start" select="number('3')"/>
							<xsl:with-param name="length" select="number('2')"/>
						</xsl:apply-templates>
					</td>
					<td width="3%">
						<br/>
					</td>
					<td width="20%" class="border-bottom"/>
					<td width="3%"/>
					<td width="63%" class="border-bottom">
						<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonMiddleName"/>
						<xsl:if test="RUDECLcat:SigningDetails/cat_ru:PersonPost">
							<br/>
							<xsl:apply-templates select="RUDECLcat:SigningDetails/cat_ru:PersonPost"/>
						</xsl:if>
						<xsl:if test="$SignatoryRepresentativeDetails">
							<br/>
							<xsl:apply-templates select="$SignatoryRepresentativeDetails/RUDECLcat:BrokerRegistryDocDetails/RUDECLcat:RegistrationNumberId"/>
							<xsl:for-each select="$SignatoryRepresentativeDetails/RUDECLcat:RepresentativeContractDetails">
								<xsl:text> договор </xsl:text>
								<xsl:if test="cat_ru:PrDocumentNumber">
									<xsl:text> № </xsl:text>
									<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
								</xsl:if>
								<xsl:if test="cat_ru:PrDocumentDate">
									<xsl:text> от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:for-each select="RUDECLcat:SignatoryPersonIdentityDetails">
							<br/>
							<xsl:text> документ: </xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
						</xsl:for-each>
						<xsl:for-each select="RUDECLcat:PowerOfAttorneyDetails">
							<br/>
							<xsl:text> доверенность: </xsl:text>
							<xsl:if test="cat_ru:PrDocumentNumber">
								<xsl:text> № </xsl:text>
								<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
							</xsl:if>
							<xsl:if test="cat_ru:PrDocumentDate">
								<xsl:text> от </xsl:text>
								<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<tr>
					<td class="graph_under" colspan="5">(дата)</td>
					<td/>
					<td class="graph_under">(подпись)</td>
					<td/>
					<td class="graph_under">(Ф. И. О. лица, действующего от имени и по поручению декларанта, реквизиты документа)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="yesno">
		<xsl:param name="context"/>
		<xsl:param name="sign"/>
		<table>
			<tbody>
				<tr>
					<td align="center">
						<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
							<xsl:if test="$context">
								<xsl:variable name="xpath_date">
									<xsl:call-template name="get_xpath">
										<xsl:with-param name="node" select="$context"/>
									</xsl:call-template>
								</xsl:variable>
								<element xml_node="{$xpath_date}">
									<xsl:if test="$sign='1' or $sign='true' or $sign='t'">
										<b>X</b>
									</xsl:if>
								</element>
							</xsl:if>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="//*[local-name()='PassengerDeclaration']//*" priority="-1">
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
	<xsl:template match="*" mode="date_part">
		<xsl:param name="start"/>
		<xsl:param name="length"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(.,$start, $length)"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
