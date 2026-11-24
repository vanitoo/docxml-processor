<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 108н от 30 июня 2023 года -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:mre="urn:customs.ru:Information:CustomsDocuments:MPOReestrExport:5.28.0">
	<!-- Шаблон для типа MPOReestrExportType -->
	<xsl:template match="mre:MPOReestrExport">
		<xsl:param name="w" select="277"/>
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
                  .font10{
					  font-size: 9pt;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {($w + 20) * 2}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										Реестр документов, предусмотренных актами Всемирного почтового союза и сопровождающих международные почтовые отправления
									</font>
									<br/>
									<br/>
									<xsl:text>№ </xsl:text>
									<xsl:apply-templates select="mre:Reestr_ID"/>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									Отправитель: <xsl:apply-templates select="mre:Consignor"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered font10">№ п/п</td>
								<td class="bordered font10">Направление перемещения товаров</td>
								<td class="bordered font10">Уникальный номер международного почтового отправления</td>
								<td class="bordered font10">Получатель</td>
								<td class="bordered font10">Адресные данные получателя</td>
								<td class="bordered font10">Страна отправления товаров</td>
								<td class="bordered font10">Страна назначения товаров</td>
								<td class="bordered font10">Наименование товаров</td>
								<td class="bordered font10">Количество товаров</td>
								<td class="bordered font10">Вес нетто товаров</td>
								<td class="bordered font10">Вес брутто международного почтового отправления</td>
								<td class="bordered font10">Стоимость товаров</td>
								<td class="bordered font10">Наименование валюты</td>
								<td class="bordered font10">Код валюты</td>
								<td class="bordered font10">Общая стоимость товаров</td>
								<td class="bordered font10">Наименование валюты</td>
								<td class="bordered font10">Код валюты цены</td>
								<td class="bordered font10">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="bordered font10">Страна происхождения товаров</td>
								<td class="bordered font10">Категория отправления</td>
								<td class="bordered font10">Документы, подтверждающие соблюдение запретов и огрничений</td>
								<td class="bordered font10">Номер и дата коммерческих документов, свидетельствующих о продаже</td>
								<td class="bordered font10">Код таможенного органа</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered font10">1</td>
								<td class="bordered font10">2</td>
								<td class="bordered font10">3</td>
								<td class="bordered font10">4</td>
								<td class="bordered font10">5</td>
								<td class="bordered font10">6</td>
								<td class="bordered font10">7</td>
								<td class="bordered font10">8</td>
								<td class="bordered font10">9</td>
								<td class="bordered font10">10</td>
								<td class="bordered font10">11</td>
								<td class="bordered font10" colspan="3">12</td>
								<td class="bordered font10" colspan="3">13</td>
								<td class="bordered font10">14</td>
								<td class="bordered font10">15</td>
								<td class="bordered font10">16</td>
								<td class="bordered font10">17</td>
								<td class="bordered font10">18</td>
								<td class="bordered font10">19</td>
							</tr>
							<xsl:for-each select="mre:MPODetail">
								<xsl:variable name="rowspan">
									<xsl:choose>
										<xsl:when test="count(mre:MPODecl/mre:Goods) != 0">
											<xsl:value-of select="count(mre:MPODecl/mre:Goods)"/>
										</xsl:when>
										<xsl:otherwise>1</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<tr valign="top">
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:RecNum"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										экспорт
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:MPO_Number"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:Consignee/cat_ru:OrganizationName"/>
										<xsl:if test="not(mre:MPODecl/mre:Consignee/cat_ru:OrganizationName) and mre:MPODecl/mre:Consignee/cat_ru:ShortName">
											<xsl:apply-templates select="mre:MPODecl/mre:Consignee/cat_ru:ShortName"/>
										</xsl:if>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:for-each select="mre:MPODecl/mre:Consignee/RUScat_ru:SubjectAddressDetails">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:DepartureCountry"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODetail/mre:MPODecl/mre:DestinationCountry"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:GoodDescription"/>
										<xsl:for-each select="mre:MPODecl/mre:Goods[1]/mre:IPObjectRegistryNum">
											<br/>
											<xsl:for-each select="*">
												<xsl:if test="position() != 1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:value-of select="$rowspan"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:MPONetWeight"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:TotalGrossWeight"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:Cost/RUScat_ru:Amount"/>
									</td>
									<td class="bordered font10"></td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:Cost/RUScat_ru:CurrencyCode"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:TotalCost/RUScat_ru:Amount"/>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}"></td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:TotalCost/RUScat_ru:CurrencyCode"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:TNVEDCode"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:OriginCountryCode"/>
									</td>
									<td class="bordered font10">
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:ConsignmentCategory/mre:CategoryCode"/>
										<xsl:text>-</xsl:text>
										<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:ConsignmentCategory/mre:CategoryDescription"/>
									</td>
									<td class="bordered font10">
										<xsl:for-each select="mre:MPODecl/mre:Goods[1]/mre:DocumentInfo">
											<xsl:apply-templates select="mre:PrecedingDocumentModeCode"/>
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
									<td class="bordered font10">
										<xsl:for-each select="mre:MPODecl/mre:Goods[1]/mre:DocumentCost">
											<xsl:apply-templates select="mre:PrecedingDocumentModeCode"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="mre:MPODecl/mre:Goods[1]/mre:URLGood">
											<br/>
											<a href="{mre:MPODecl/mre:Goods[1]/mre:URLGood}">Товар в интернет-магазине</a>
										</xsl:if>
										<xsl:if test="mre:MPODecl/mre:Goods[1]/mre:OrderNumber">
											<xsl:text> Заказ № </xsl:text>
											<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:OrderNumber"/>
										</xsl:if>
										<xsl:if test="mre:MPODecl/mre:Goods[1]/mre:OrderDate">
											<xsl:text> от </xsl:text>
											<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:OrderDate" mode="russian_date"/>
										</xsl:if>
									</td>
									<td class="bordered font10" rowspan="{$rowspan}">
										<xsl:apply-templates select="mre:MPODecl/mre:CustomsCode"/>
									</td>
								</tr>
								<xsl:apply-templates select="mre:MPODecl/mre:Goods[position() &gt; 1]"/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="mre:Goods">
		<tr valign="top">
			<td class="bordered font10">
				<xsl:apply-templates select="mre:GoodDescription"/>
				<xsl:for-each select="mre:IPObjectRegistryNum">
					<br/>
					<xsl:for-each select="*">
						<xsl:if test="position() != 1">, </xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</xsl:for-each>
			</td>
			<td class="bordered font10">
				<xsl:apply-templates select="mre:Cost/RUScat_ru:Amount"/>
			</td>
			<td class="bordered font10"></td>
			<td class="bordered font10">
				<xsl:apply-templates select="mre:Cost/RUScat_ru:CurrencyCode"/>
			</td>
			<td class="bordered font10">
				<xsl:apply-templates select="mre:TNVEDCode"/>
			</td>
			<td class="bordered font10">
				<xsl:apply-templates select="mre:OriginCountryCode"/>
			</td>
			<td class="bordered font10">
				<xsl:apply-templates select="mre:ConsignmentCategory/mre:CategoryCode"/>
				<xsl:text>-</xsl:text>
				<xsl:apply-templates select="mre:ConsignmentCategory/mre:CategoryDescription"/>
			</td>
			<td class="bordered font10">
				<xsl:for-each select="mre:DocumentInfo">
					<xsl:apply-templates select="mre:PrecedingDocumentModeCode"/>
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
			<td class="bordered font10">
				<xsl:for-each select="mre:DocumentCost">
					<xsl:apply-templates select="mre:PrecedingDocumentModeCode"/>
					<xsl:if test="cat_ru:PrDocumentNumber">
						<xsl:text> № </xsl:text>
						<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
					</xsl:if>
					<xsl:if test="cat_ru:PrDocumentDate">
						<xsl:text> от </xsl:text>
						<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="mre:URLGood">
					<br/>
					<a href="{mre:URLGood}">Товар в интернет-магазине</a>
				</xsl:if>
				<xsl:if test="mre:OrderNumber">
					<xsl:text> Заказ № </xsl:text>
					<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:OrderNumber"/>
				</xsl:if>
				<xsl:if test="mre:OrderDate">
					<xsl:text> от </xsl:text>
					<xsl:apply-templates select="mre:MPODecl/mre:Goods[1]/mre:OrderDate" mode="russian_date"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="mre:Consignor">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'PersonId' or local-name() = 'IdentityCard']">
				<!-- считаем, что это ФЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- ЮЛ -->
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
				<xsl:if test="not(cat_ru:OrganizationName)">
					<xsl:apply-templates select="cat_ru:ShortName"/>
				</xsl:if>
				<xsl:if test="RUScat_ru:SubjectAddressDetails">
					<xsl:text>, адрес(а): </xsl:text>
					<xsl:apply-templates select="RUScat_ru:SubjectAddressDetails" mode="address"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
				</xsl:if>
				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="identityCard">
		<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text> выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:if test="position() != 1">; </xsl:if>
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
	<xsl:template match="//*[local-name()='MPOReestrExport']//*" priority="-1">
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
