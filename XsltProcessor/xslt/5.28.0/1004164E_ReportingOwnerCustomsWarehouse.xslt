<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rocw="urn:customs.ru:ReportingCollection:ReportingOwnerCustomsWarehouse:5.27.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа ReportingOwnerCustomsWarehouseType -->
	<xsl:template match="rocw:ReportingOwnerCustomsWarehouse">
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
					
					.value
					{border-bottom: solid 1px black;
					font-style: italic;
					vertical-align:bottom;}

					.descr
					{font-size: 7pt;
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
										<b>Отчет владельца таможенного склада</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table class="inlinetable" style="width: 100%;">
						<xsl:text>Владелец таможенного склада</xsl:text>
						<tbody>
							<tr align="center">
								<td class="value" width="100%;">
									<xsl:apply-templates select="rocw:Organization"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(организационно-правовая форма, наименование, идентификационный номер налогоплательщика, код причины постановки на учет)
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<div style="width: 100%; text-align: left;">
						<xsl:text>Свидетельство о включении в реестре владельцев складов от </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align:center;">
							<xsl:apply-templates select="rocw:CertOfInclusion/rocw:CertOfInclusionDate" mode="russian_date"/>
						</span>
						<xsl:text> № </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black; text-align:center;">
							<xsl:apply-templates select="rocw:CertOfInclusion/rocw:CertOfInclusionNumber"/>
						</span>
					</div>
					<br/>
					<br/>
					<br/>
					<div style="width: 100%; text-align: center;">
						<xsl:text>Представляется за период с </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
							<xsl:apply-templates select="rocw:ReportPeriod/rocw:StartDate" mode="russian_date"/>
						</span>
						<xsl:text> по </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
							<xsl:apply-templates select="rocw:ReportPeriod/rocw:EndDate" mode="russian_date"/>
						</span>
					</div>
				</div>
				<div class="page" style="width: {$w * 3}mm;">
					<table width="100%">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" colspan="8">Раздел I<br/>Товары, помещенные под таможенную процедуру таможенного склада</td>
								<td class="bordered" colspan="6">Раздел II<br/>Товары, в отношении которых таможенная процедура таможенного склада завершена в соответствии с подпунктами 1, 5 и 6 пункта 1, пунктом 3 статьи 161 ТК ЕАЭС</td>
								<td class="bordered" colspan="4">Раздел III<br/>Товары, в отношении которых таможенная процедура таможенного склада завершена в соответствии с подпунктами 2 – 4, 7 и 8 пункта 1 статьи 161 ТК ЕАЭС</td>
								<td class="bordered" colspan="2">Раздел IV<br/>Товары, в отношении которых таможенная процедура таможенного склада прекращена в соответствии с пунктами 5 и 6 статьи 161 ТК ЕАЭС</td>
								<td class="bordered" colspan="2">Раздел V<br/>Остаток товара, помещенного под таможенную процедуру таможенного склада, на конец отчетного периода</td>
								<td class="bordered" rowspan="2">Раздел VI<br/>Примечание (при наличии)</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">рег.номер ДТ / номер товара в ДТ</td>
								<td class="bordered">код ТН ВЭД</td>
								<td class="bordered">наименование товара и его описание</td>
								<td class="bordered">вес брутто, кг</td>
								<td class="bordered">кол-во товара в ДЕИ / единица измерения</td>
								<td class="bordered">дата размещения товара на таможенном складе</td>
								<td class="bordered">дата истечения срока действия таможенной процедуры таможенного склада</td>
								<td class="bordered">срок годности и (или) реализации товара</td>
								
								<td class="bordered">код таможенной процедуры</td>
								<td class="bordered">рег.номер ТД / номер товара в ДТ/ реквизиты иного док-та, в соотв. с которым таможенная процедура таможенного склада завершена</td>
								<td class="bordered">код ТН ВЭД</td>
								<td class="bordered">наименование товара и его описание</td>
								<td class="bordered">вес брутто, кг</td>
								<td class="bordered">кол-во товара в ДЕИ / единица измерения</td>
								
								<td class="bordered">док-т, подтверждающий завершение таможенной процедуры таможенного склада в соотв. с подпунктами 2 – 4, 7 и 8 пункта 1 статьи 161 ТК ЕАЭС</td>
								<td class="bordered">наименование товара и его описание</td>
								<td class="bordered">вес брутто, кг</td>
								<td class="bordered">кол-во товара в ДЕИ / единица измерения</td>
								
								<td class="bordered">реквизиты протокола о задержании товара и документов на них</td>
								<td class="bordered">дата вывоза товара с таможенного склада</td>
								
								<td class="bordered">вес брутто, кг</td>
								<td class="bordered">кол-во товара в ДЕИ / единица измерения</td>
							</tr>
							<tr align="center" valign="top">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
								<td class="bordered">6</td>
								<td class="bordered">7</td>
								<td class="bordered">8</td>
								<td class="bordered">9</td>
								<td class="bordered">10</td>
								<td class="bordered">11</td>
								<td class="bordered">12</td>
								<td class="bordered">13</td>
								<td class="bordered">14</td>
								<td class="bordered">15</td>
								<td class="bordered">16</td>
								<td class="bordered">17</td>
								<td class="bordered">18</td>
								<td class="bordered">19</td>
								<td class="bordered">20</td>
								<td class="bordered">21</td>
								<td class="bordered">22</td>
								<td class="bordered">23</td>
								<td class="bordered">24</td>
							</tr>
							<xsl:for-each select="rocw:GoodsInfo">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:apply-templates select="rocw:GoodsPosition"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:GTDNumber"/>
										<xsl:if test="rocw:Section1/rocw:GoodsNumeric">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rocw:Section1/rocw:GoodsNumeric"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:SupplementaryQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:PlacementDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:ExpirationDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section1/rocw:ShelfLife/rocw:ShelfLifeDate" mode="russian_date"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:ProcedureCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:GTDNumber"/>
										<xsl:if test="rocw:Section2/rocw:GoodsNumeric">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rocw:Section2/rocw:GoodsNumeric"/>
										</xsl:if>
										<xsl:if test="rocw:Section2/rocw:CompletedProcDoc">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rocw:Section2/rocw:CompletedProcDoc"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section2/rocw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section3/rocw:CompletedProcDoc"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section3/rocw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section3/rocw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section3/rocw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section4/rocw:ProtocolDetails" mode="doc"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section4/rocw:IssuanceDate" mode="russian_date"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section5/rocw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rocw:Section5/rocw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rocw:Notes"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="bottom">
								<td width="20%">
									<xsl:apply-templates select="rocw:PersonPost/cat_ru:PersonPost"/>
								</td>
								<td width="10%"></td>
								<td width="15%"></td>
								<td width="10%"></td>
								<td width="30%">
									<xsl:for-each select="rocw:PersonPost/*[contains(local-name(), 'ame')]">
										<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td width="10%"></td>
								<td width="15%">
									<xsl:apply-templates select="rocw:PersonPost/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td class="descr" style="border-top: 1px solid black;">(должность)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(подпись руководителя организации или лица, им уполномоченного)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(фамилия, имя, отчество (при наличии))</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(дата)</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
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

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rocw:GTDNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<!-- Шаблон для типа rocw:OrganizationInfoType -->
	<xsl:template match="rocw:Organization">
		<xsl:apply-templates select="rocw:OrganizationName"/>
		<xsl:text>, </xsl:text>
		<xsl:text> ИНН </xsl:text>
		<xsl:apply-templates select="rocw:INN"/>
		<xsl:text> КПП </xsl:text>
		<xsl:apply-templates select="rocw:KPP"/>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="*" mode="doc">
		<xsl:if test="*[local-name() = 'PrDocumentName']">
			<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rocw:SuppQuantityType -->
	<xsl:template match="rocw:SupplementaryQuantity">
		<xsl:apply-templates select="rocw:GoodsQuantity" mode="translate_number"/>
		<xsl:if test="rocw:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="rocw:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="rocw:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="rocw:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='ReportingOwnerCustomsWarehouse']//*" priority="-1">
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
