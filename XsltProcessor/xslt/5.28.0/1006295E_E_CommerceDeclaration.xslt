<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:e_cd="urn:customs.ru:Information:CustomsDocuments:E_CommerceDeclaration:5.28.0">
	<xsl:template match="/">
		<xsl:apply-templates select="//e_cd:E_CommerceDeclaration"/>
	</xsl:template>
	<xsl:template match="e_cd:E_CommerceDeclaration">
		<xsl:param name="w" select="297"/>
		<xsl:variable name="category" select="e_cd:GoodsCategoryCode"/>
		<xsl:variable name="procedure" select="e_cd:CustomsModeCode"/>
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
                  padding: 5mm;
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



                  table.border { border-collapse: collapse; }
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
					<span style="font-size: 7pt;">Декларация на товары электронной торговли</span>
					<table class="border" style="1px solid black;table-layout: fixed; font-size: 7pt;">
						<tbody>
							<!-- Общая часть -->
							<tr>
								<!--1--><td style="border: none; width: 5mm;"></td>
								<!--2--><td style="border: none;"></td>
								<!--3--><td style="border: none;"></td>
								<!--4--><td style="border: none;"></td>
								<!--5--><td style="border: none;"></td>
								<!--6--><td style="border: none; width: 5mm;"></td>
								<!--7--><td style="border: none; width: 40mm;"></td>
								<!--8--><td style="border: none;"></td>
								<!--9--><td style="border: none;"></td>
								<!--10--><td style="border: none;"></td>
								<!--11--><td style="border: none;"></td>
								<!--12--><td style="border: none;"></td>
								<!--13--><td style="border: none;"></td>
								<!--14--><td style="border: none;"></td>
								<!--15--><td style="border: none;"></td>
								<!--16--><td style="border: none; width: 30mm;"></td>
							</tr>
							<tr valign="top">
								<td colspan="4" rowspan="2">
									<xsl:text>Отправитель (по общей накладной)</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:ConsignorDetails" mode="consign"/>
								</td>
								<td colspan="3" rowspan="2">
									<xsl:text>Получатель (по общей накладной)</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:ConsigneeDetails" mode="consign"/>
								</td>
								<td colspan="6">А</td>
								<td colspan="2">
									<xsl:text>ДЭТ</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:ElectronicDocumentSign"/>
								</td>
								<td>
									<xsl:text>Особенность</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:DeclarationKind"/>
								</td>
							</tr>
							<tr valign="top">
								<td colspan="4">
									<xsl:text>Место нахождения товаров</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:GoodsLocationDetails"/>
								</td>
								<td colspan="2">
									<xsl:text>Категория товаров</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:GoodsCategoryCode"/>
								</td>
								<td colspan="2">
									<xsl:text>Кол-во листов</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:TotalSheetNumber"/>
								</td>
								<td>
									<xsl:text>Процедура</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:CustomsModeCode"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="e_cd:PreviousCustomsModeCode"/>
								</td>
							</tr>
							<!-- Заголовок таблицы -->
							<tr align="center">
								<td colspan="5">Общие сведения</td>
								<td colspan="8">Сведения о товарах</td>
								<td colspan="2">Сведения о документах</td>
								<td rowspan="4">Предшествующий документ</td>
							</tr>
							<tr align="center" valign="middle">
								<!--1--><td rowspan="2">№ п/п</td>
								<!--2--><td rowspan="2">Общая накладная</td>
								<!--3--><td rowspan="2">Инд. накладная</td>
								<!--4--><td rowspan="2">Инд. отправитель</td>
								<!--5--><td rowspan="2">Инд. получатель</td>
								<!--6--><td rowspan="2">№ п/п</td>
								<!--7--><td rowspan="2">Наименование</td>
								<!--8--><td rowspan="2">Код НД ВЭД ЕАЭС</td>
								<!--9--><td rowspan="2">Кол-во</td>
								<!--10, 11--><td colspan="2">Вес</td>
								<!--12--><td rowspan="2">Валюта и стоимость</td>
								<!--13--><td rowspan="2">Таможенная стоимость</td>
								<!--14--><td rowspan="2">Код, признак</td>
								<!--15--><td rowspan="2">Дата, номер</td>
							</tr>
							<tr valign="middle" align="center">
								<td>брутто</td>
								<td>нетто</td>
							</tr>
							<tr align="center">
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
								<td>15</td>
							</tr>
							<!-- товары -->
							<xsl:for-each select="e_cd:GoodsShipment/e_cd:HouseShipment">
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="e_cd:GoodsItemDetails">
											<xsl:value-of select="count(e_cd:GoodsItemDetails)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td rowspan="{$rowspan + 1}">
										<xsl:apply-templates select="e_cd:ObjectOrdinal"/>
									</td>
									<td rowspan="{$rowspan}">
										<xsl:apply-templates select="e_cd:TransportDocumentDetails" mode="doc"/>
									</td>
									<td rowspan="{$rowspan}">
										<xsl:apply-templates select="e_cd:HouseWaybillDetails" mode="doc"/>
									</td>
									<td rowspan="{$rowspan}">
										<xsl:apply-templates select="e_cd:ConsignorDetails" mode="consign"/>
									</td>
									<td rowspan="{$rowspan}">
										<xsl:apply-templates select="e_cd:ConsigneeDetails" mode="consign"/>
									</td>
									<xsl:call-template name="draw_goods">
										<xsl:with-param name="goods" select="e_cd:GoodsItemDetails[1]"/>
									</xsl:call-template>
								</tr>
								<xsl:for-each select="e_cd:GoodsItemDetails[position() &gt; 1]">
									<tr valign="top">
										<xsl:call-template name="draw_goods">
											<xsl:with-param name="goods" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
								<tr valign="top">
									<td colspan="8">Всего по транспортному (перевозочному) документу</td>
									<td>
										<xsl:apply-templates select="e_cd:UnifiedGrossWeightQuantity" mode="quantity"/>
									</td>
									<td></td>
									<td>
										<xsl:apply-templates select="e_cd:CAValueAmount" mode="spaced"/>
									</td>
									<td>
										<xsl:apply-templates select="e_cd:CustomsCost" mode="spaced"/>
									</td>
									<td colspan="3"></td>
								</tr>
							</xsl:for-each>
							<tr valign="top">
								<td colspan="9">Всего по декларации</td>
								<td>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:UnifiedGrossWeightQuantity" mode="quantity"/>
								</td>
								<td></td>
								<td>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:CAValueAmount" mode="spaced"/>
								</td>
								<td>
									<xsl:apply-templates select="e_cd:GoodsShipment/e_cd:CustomsCost" mode="spaced"/>
								</td>
								<td colspan="3"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table class="border" style="1px solid black;table-layout: fixed; font-size: 7pt;">
						<tbody>
							<tr>
								<td style="border: none; width: 30mm;"></td>
								<td style="border: none;"></td>
								<td style="border: none;"></td>
								<td style="border: none;"></td>
								<td style="border: none;"></td>
								<td style="border: none;"></td>
								<td style="border: none;width:50%"></td>
							</tr>
							<xsl:variable name="ShipmentAmount" select="count(e_cd:GoodsShipment/e_cd:HouseShipment[e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails])"/>
							<xsl:variable name="PaymentDetailsAmount" select="count(e_cd:GoodsShipment/e_cd:HouseShipment[e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails][position() != last()]/e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails)"/>
							<xsl:variable name="LastShipmentAmount" select="count(e_cd:GoodsShipment/e_cd:HouseShipment[e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails][position() = last()]/e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails)"/>
							<xsl:variable name="signatoryPersonRowspan" select="3 + $PaymentDetailsAmount + ($ShipmentAmount - 1)"/>
							<xsl:variable name="graphCRowspan" select="$LastShipmentAmount + 2"/>
							<tr valign="top">
								<td align="center" colspan="6">B. Исчисление платежей</td>
								<td rowspan="{$signatoryPersonRowspan}">
									<xsl:text>Сведения о лице, заполнившем ДЭТ, дата</xsl:text>
									<br/>
									<xsl:apply-templates select="e_cd:SignatoryPerson"/>
								</td>
							</tr>
							<tr valign="middle" align="center">
								<td>Товар</td>
								<td>Вид</td>
								<td>База для начисления</td>
								<td>Код базы для начисления</td>
								<td>Ставка</td>
								<td>Сумма</td>
							</tr>
							<tr align="center">
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
							</tr>
							<xsl:for-each select="e_cd:GoodsShipment/e_cd:HouseShipment[e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails]">
								<xsl:variable name="ShipmentPosition" select="position()"/>
								<xsl:variable name="houseShipment" select="."/>
								<xsl:for-each select="e_cd:GoodsItemDetails/e_cd:CustomsPaymentDetails">
									<xsl:variable name="goodsItem" select="./.."/>
									<tr valign="top">
										<td>
											<xsl:apply-templates select="$houseShipment/e_cd:ObjectOrdinal"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="$goodsItem/e_cd:TotalGoodsNumeric"/>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="$goodsItem/e_cd:GoodsNumeric"/>
										</td>
										<td>
											<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
										</td>
										<td>
											<xsl:apply-templates select="RUDECLcat:TaxBase"/>
										</td>
										<td>
											<xsl:choose>
												<xsl:when test="RUDECLcat:TaxBaseCurrencyCode">
													<xsl:apply-templates select="RUDECLcat:TaxBaseCurrencyCode"/>
												</xsl:when>
												<xsl:when test="RUDECLcat:TaxBaseQualifierCode">
													<xsl:value-of select="RUDECLcat:TaxBaseQualifierCode"/>
												</xsl:when>
											</xsl:choose>
										</td>
										<td>
											<xsl:choose>
												<xsl:when test="$category = 'ЭФ'"></xsl:when>
											</xsl:choose>
											<xsl:apply-templates select="." mode="rate1"/>
										</td>
										<td>
											<xsl:apply-templates select="RUDECLcat:PaymentAmount" mode="number2digits"/>
										</td>
										<xsl:if test="position() = 1 and $ShipmentPosition = $ShipmentAmount">
											<td rowspan="{$graphCRowspan}">C</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
								<tr valign="top">
									<td>Всего по транспортному (перевозочному) документу</td>
									<td>
										<xsl:for-each select="e_cd:CustomsPaymentDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="RUDECLcat:PaymentModeCode"/>
										</xsl:for-each>
									</td>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<xsl:for-each select="e_cd:CustomsPaymentDetails">
											<xsl:if test="position()!=1"><br/></xsl:if>
											<xsl:apply-templates select="RUDECLcat:PaymentAmount" mode="number2digits"/>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
							<tr valign="top">
								<td>Всего по декларации</td>
								<td>
									<xsl:for-each select="e_cd:GoodsShipment/e_cd:PaymentAmountDetails">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="e_cd:PaymentModeCode"/>
									</xsl:for-each>
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<xsl:for-each select="e_cd:GoodsShipment/e_cd:PaymentAmountDetails">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="e_cd:Amount" mode="number2digits"/>
									</xsl:for-each>
								</td>
							</tr>
							<!-- нижняя часть -->
							<tr valign="top">
								<td colspan="6" align="center">B1. Подробности уплаты (взыскания)</td>
								<td rowspan="4">D</td>
							</tr>
							<tr align="center" valign="top">
								<td colspan="3">Сведения об уплате (взыскании)</td>
								<td colspan="3">Прекращение обязанности</td>
							</tr>
							<tr align="center">
								<td colspan="3">1</td>
								<td colspan="3">2</td>
							</tr>
							<tr align="left" valign="top">
								<td colspan="3">
									<xsl:for-each select="e_cd:GoodsShipment/e_cd:FactCustomsPayment">
										<xsl:if test="position()!=1"><br/></xsl:if>
										<xsl:apply-templates select="catESAD_cu:PaymentModeCode"/>
										<xsl:text>-</xsl:text>
										<xsl:apply-templates select="catESAD_cu:PaymentAmount"/>
										<xsl:text>-</xsl:text>
										<xsl:apply-templates select="catESAD_cu:PaymentCurrencyCode"/>
										<xsl:text>-</xsl:text>
										<xsl:text>-</xsl:text>
										<xsl:text>-</xsl:text>
										<xsl:text>-</xsl:text>
										<xsl:choose>
											<xsl:when test="e_cd:RFOrganizationFeatures">
												<xsl:apply-templates select="e_cd:RFOrganizationFeatures/cat_ru:INN"/>
												<xsl:apply-templates select="e_cd:RFOrganizationFeatures/cat_ru:KPP"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="e_cd:PayerIdentityDetails" mode="identity"/>
											</xsl:otherwise>
										</xsl:choose>
										
									</xsl:for-each>
								</td>
								<td colspan="3"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="e_cd:SignatoryPerson">
		<xsl:apply-templates select="e_cd:QualificationCertificate"/>
		<br/>
		<xsl:apply-templates select="e_cd:SigningDetails" mode="FIO"/>
		<br/>
		<xsl:apply-templates select="e_cd:SignatoryPersonIdentityDetails" mode="identity"/>
		<br/>
		<xsl:apply-templates select="e_cd:SigningDetails/cat_ru:PersonPost"/>
		<br/>
		<xsl:apply-templates select="e_cd:SigningDetails/RUScat_ru:CommunicationDetails" mode="commDetails"/>
		<br/>
		<xsl:apply-templates select="e_cd:SigningDetails/RUScat_ru:SigningDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="commDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="FIO">
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"> </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="number2digits">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.00')"/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="rate1">

		<xsl:choose>
			<xsl:when test="RUDECLcat:Rate or RUDECLcat:Rate!=''">
				<xsl:apply-templates select="RUDECLcat:Rate" mode="rate_val"/>
			</xsl:when>
			<xsl:otherwise> 0 </xsl:otherwise>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="RUDECLcat:RateTypeCode='%'">%</xsl:when>
			<xsl:when test="RUDECLcat:RateTypeCode!='*' or not(RUDECLcat:RateTypeCode)">
				<xsl:choose>
					<xsl:when test="RUDECLcat:RateCurrencyCode">
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="RUDECLcat:RateCurrencyCode"/>
						<xsl:if test="RUDECLcat:RateTNVEDQualifierCode">
							<xsl:text> за </xsl:text>
							<xsl:apply-templates select="RUDECLcat:WeightingFactor"/>
							<xsl:text> </xsl:text>
							<xsl:apply-templates select="RUDECLcat:RateTNVEDQualifierCode"/>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise> % </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="rate_val">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="format-number(.,'0.######')"/>
		</element>
	</xsl:template>
	<xsl:template match="e_cd:GoodsLocationDetails">
		<xsl:for-each select="*[local-name() != 'GoodLocationTransportMeansDetails']">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:choose>
				<xsl:when test="local-name() = 'SubjectAddressDetails'">
					<xsl:apply-templates select="." mode="address"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="e_cd:RegisterDocumentIdDetails">
		<xsl:apply-templates select="*[local-name() = 'DocId']"/>
	</xsl:template>
	<xsl:template match="*" mode="consign">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName)">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="local-name() = 'SubjectBranch' and RUScat_ru:SubjectAddressDetails">
			<xsl:text> Адрес: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		
		<xsl:if test="local-name() != 'SubjectBranch' and RUScat_ru:SubjectAddressDetails">
			<xsl:text> Адрес: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
		</xsl:if>
		
		<xsl:if test="local-name() != 'SubjectBranch' and RUScat_ru:IdentityCard">
			<xsl:text> Удостов. личности: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identity"/>
		</xsl:if>
		
		<xsl:if test="RUScat_ru:SubjectBranch">
			<xsl:text> Обособленное позраделение: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'SubjectBranch']" mode="consign"/>
		</xsl:if>
		
	</xsl:template>
	<xsl:template match="*" mode="identity">
		<xsl:apply-templates select="*[local-name() = 'CountryCode']"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardCode']"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН/ПИН </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text> УНН </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text> УНП </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> ИНФЛ </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
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
	<xsl:template name="draw_goods">
		<xsl:param name="goods"/>
		<td>
			<xsl:apply-templates select="$goods/e_cd:TotalGoodsNumeric"/>
		</td>
		<td>
			<xsl:apply-templates select="$goods/e_cd:GoodsDescription"/>
			<xsl:for-each select="$goods/e_cd:AddGoodsMeasureDetails">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="." mode="quantity"/>
			</xsl:for-each>
			<xsl:if test="$goods/e_cd:TradeMark">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="$goods/e_cd:TradeMark"/>
			</xsl:if>
			<xsl:if test="$goods/e_cd:IPObjectRegistryNum/catESAD_cu:IPORegistryNumber">
				<xsl:text>, ОИС: </xsl:text>
			</xsl:if>
			<xsl:for-each select="$goods/e_cd:IPObjectRegistryNum/catESAD_cu:IPORegistryNumber">
				<xsl:if test="position() != 1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			<xsl:if test="$goods/e_cd:ProductionPlaceName">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="$goods/e_cd:ProductionPlaceName"/>
			</xsl:if>
		</td>
		<td>
			<xsl:apply-templates select="$goods/e_cd:GoodsTNVEDCode"/>
		</td>
		<td>
			<xsl:apply-templates select="$goods/e_cd:SupplementaryQuantity" mode="quantity"/>
		</td>
		<td>
			<xsl:apply-templates select="$goods/e_cd:GrossWeightQuantity" mode="quantity"/>
		</td>
		<td>
			<xsl:apply-templates select="$goods/e_cd:NetWeightQuantity" mode="quantity"/>
		</td>
		<td>
			<xsl:for-each select="$goods/e_cd:CAValueAmount">
				<xsl:if test="position() != 1"><br/></xsl:if>
				<xsl:for-each select="*">
					<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:for-each>
		</td>
		<td>
			<xsl:for-each select="$goods/e_cd:CustomsCost/*">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</td>
		<td>
			<xsl:for-each select="$goods/e_cd:PresentedDocDetails">
				<xsl:if test="position() != 1"><br/></xsl:if>
				<xsl:apply-templates select="e_cd:DocumentPresentingDetails/RUDECLcat:PresentedDocumentModeCode"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="e_cd:DocumentPresentingDetails/RUDECLcat:DocPresentKindCode"/>
			</xsl:for-each>
		</td>
		<td>
			<xsl:for-each select="$goods/e_cd:PresentedDocDetails">
				<xsl:if test="position() != 1"><br/></xsl:if>
				<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			</xsl:for-each>
		</td>
		<td>
			<xsl:choose>
				<xsl:when test="not($goods/e_cd:PrecedingDocDetails)">-</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$goods/e_cd:PrecedingDocDetails"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>
	<xsl:template match="e_cd:PrecedingDocDetails">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="e_cd:PrecedingDocumentModeCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cd:CustomsDocIdDetails" mode="gtd_num"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cd:TIRIdDetails" mode="spaced"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cd:SVHDocNumber"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="e_cd:SVHDocDate" mode="russian_date"/>
	</xsl:template>
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="gtd_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
		<xsl:if test="*[local-name() = 'Code']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Number')"> № </xsl:when>
				<xsl:when test="contains(local-name(), 'Date')"> от </xsl:when>
				<xsl:when test="contains(local-name(), 'Code')"> код </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		
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
	<xsl:template match="//*[local-name()='E_CommerceDeclaration']//*" priority="-1">
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
