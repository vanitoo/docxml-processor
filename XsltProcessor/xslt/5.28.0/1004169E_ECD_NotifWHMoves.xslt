<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ecd_nm="urn:customs.ru:Information:ExchangeDocuments:ECD_NotifWHMoves:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ECD_NotifWHMovesType -->
	<xsl:template match="ecd_nm:ECD_NotifWHMoves">
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
                  
                  .inlinetable
					{
					border: 0;
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
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<font size="4">
										<b>
											<xsl:text>Уведомление</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="ecd_nm:DocKind = 1">о вывозе со склада</xsl:when>
												<xsl:when test="ecd_nm:DocKind = 2">о возврате на склад</xsl:when>
											</xsl:choose>
											<xsl:text> электронной торговли товаров электронной торговли, предназначенных для реализации физическим лицам, помещенных под таможенную процедуру таможенного склада, для доставки физическому лицу, являющемуся получетем таких товаров</xsl:text>
											<br/>
											<br/>
											<xsl:text>№ </xsl:text>
											<table class="inlinetable" style="min-width: 90mm; width: 90mm;">
												<tbody>
													<tr align="center">
														<td class="value">
															<b>
																<xsl:apply-templates select="ecd_nm:NotifNumber" mode="reg_num"/>
															</b>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr">
															Регистрационный номер уведомления
														</td>
													</tr>
												</tbody>
											</table>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="ecd_nm:Applicant"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование, идентификационный номер налогоплательщика, код причины постановки на учет организации)
								</td>
							</tr>
						</tbody>
					</table>
					<p style="text-align: justify;">
						<xsl:text>в соответствии со статьей 203 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" уведомляет о </xsl:text>
						<xsl:choose>
							<xsl:when test="ecd_nm:DocKind = 1">
								<xsl:text>вывозе </xsl:text>
								<table class="inlinetable" style="min-width: 50mm; width: 50mm;">
									<tbody>
										<tr align="center">
											<td class="value">
												<xsl:apply-templates select="ecd_nm:CloseDate" mode="russian_date"/>
												<br/>
											</td>
										</tr>
										<tr align="center">
											<td class="descr">
												(дата вывоза)
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:text> </xsl:text>
							</xsl:when>
							<xsl:when test="ecd_nm:DocKind = 2">
								<xsl:text>возврате </xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:text>товаров электронной торговли, предназначенных для реализации физичеким лицам, помещенных под таможенную процедуру таможенного склада, по декларации на товар </xsl:text>
						<table class="inlinetable" style="min-width: 90mm; width: 90mm;">
							<tbody>
								<tr align="center">
									<td class="value">
										<xsl:apply-templates select="ecd_nm:ECD_Number" mode="reg_num"/>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td class="descr">
										(номер декларации на товары электронной торговли)
									</td>
								</tr>
							</tbody>
						</table>
					</p>
					<br/>
					<br/>
					<table style="font-size: 10pt;">
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Номер отправления (индивидуальной накладной)</td>
								<xsl:if test="ecd_nm:DocKind = 2">
									<td class="bordered">Номер и дата уведомления о вывозе</td>
								</xsl:if>
								<td class="bordered">Наименование товара</td>
								<td class="bordered">Код товара в соответствии с Единой товарной номенклатурой внешнеэкономической деятельности</td>
								<td class="bordered">Количество, единицы измерения в соответствии с классификатором единиц измерения и счета Евразийского экономического союза</td>
								<td class="bordered">Стоимость, валюта покупки</td>
								<td class="bordered">Вес нетто, кг</td>
								<td class="bordered">Вес брутто, кг</td>
								<td class="bordered">Сведения о документах, подтверждающих соблюдение запретов и ограничений (код вида / номер / дата / срок действия документа)</td>
							</tr>
							<tr align="center">
								<xsl:variable name="add">
									<xsl:choose>
										<xsl:when test="ecd_nm:DocKind = 2"><xsl:value-of select="number(1)"/></xsl:when>
										<xsl:otherwise><xsl:value-of select="number(0)"/></xsl:otherwise>
									</xsl:choose>
								</xsl:variable>
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<xsl:if test="ecd_nm:DocKind = 2">
									<td class="bordered">3</td>
								</xsl:if>
								<td class="bordered"><xsl:value-of select="3 + $add"/></td>
								<td class="bordered"><xsl:value-of select="4 + $add"/></td>
								<td class="bordered"><xsl:value-of select="5 + $add"/></td>
								<td class="bordered"><xsl:value-of select="6 + $add"/></td>
								<td class="bordered"><xsl:value-of select="7 + $add"/></td>
								<td class="bordered"><xsl:value-of select="8 + $add"/></td>
								<td class="bordered"><xsl:value-of select="9 + $add"/></td>
							</tr>
							<xsl:for-each select="ecd_nm:Goods">
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:GoodsNumber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:ShipmentNumber"/>
									</td>
									<xsl:if test="../ecd_nm:DocKind = 2">
										<td class="bordered">
											<xsl:apply-templates select="ecd_nm:NotifNumber" mode="reg_num"/>
										</td>
									</xsl:if>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:GoodsNomenclatuerCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:SupplementaryQuantity" mode="quantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:ContractCost" mode="splitSpace"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:GoodsNetWeight"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:GoodsGrossWeight"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ecd_nm:Documents"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="ecd_nm:Documents">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="*[local-name() = 'DocKindCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'DocStartDate']" mode="russian_date"/>
		<xsl:if test="*[local-name() = 'DocStartDate'] and *[local-name() = 'DocValidityDate']"> - </xsl:if> 
		<xsl:apply-templates select="*[local-name() = 'DocValidityDate']" mode="russian_date"/>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="*[local-name() = 'GoodsQuantity']"/>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierName']">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierName']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'MeasureUnitQualifierCode']">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'MeasureUnitQualifierCode']"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="ecd_nm:Applicant">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text>, ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<xsl:text>, КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
		<xsl:if test="*[4]">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[4]"/>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='ECD_NotifWHMoves']//*" priority="-1">
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
