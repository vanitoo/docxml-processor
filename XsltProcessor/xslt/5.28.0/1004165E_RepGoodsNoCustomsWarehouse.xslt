<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rgncw="urn:customs.ru:Information:ReportingCollection:RepGoodsNoCustomsWarehouse:5.27.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа RepGoodsNoCustomsWarehouseType -->
	<xsl:template match="rgncw:RepGoodsNoCustomsWarehouse">
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
										<b>Отчет лица, поместившего товары под таможенную процедуру<br/>
										таможенного склада и осуществляющего их хранение в местах,<br/>
										не являющихся таможенными складами</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value" width="100%;">
									<xsl:apply-templates select="rgncw:Organization"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование, идентификационный номер налогоплательщика, код причины постановки на учет, место нахождения юридического лица, адрес в пределах местонахождения или фамилия, имя,отчество (при наличии), идентификационный номер налогоплательщика (при наличии), адрес регистрации по месту жительства или адрес регистрации по месту пребывания физического лица)
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<xsl:text>Место хранения товаров</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%;">
									<xsl:for-each select="rgncw:StorageAddress">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:apply-templates select="." mode="address"/>
									</xsl:for-each>
									<br/>
									<xsl:apply-templates select="rgncw:StorageZTKDoc" mode="doc"/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(сведения о месте хранения товаров и реквизитах документа о создании зоны таможенного контроля в месте хранения товаров)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<div style="width: 100%; text-align: center;">
						<xsl:text>Представляется за период с </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
							<xsl:apply-templates select="rgncw:BeginReportDate" mode="russian_date"/>
						</span>
						<xsl:text> по </xsl:text>
						<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
							<xsl:apply-templates select="rgncw:EndReportDate" mode="russian_date"/>
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
							<xsl:for-each select="rgncw:GoodsInfo">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:apply-templates select="rgncw:GoodsPosition"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:GTDNumber"/>
										<xsl:if test="rgncw:Section1/rgncw:GoodsNumeric">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rgncw:Section1/rgncw:GoodsNumeric"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:SupplementaryQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:PlacementDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:ExpirationDate" mode="russian_date"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section1/rgncw:ShelfLife/rgncw:ShelfLifeDate" mode="russian_date"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:ProcedureCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:GTDNumber"/>
										<xsl:if test="rgncw:Section2/rgncw:GoodsNumeric">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rgncw:Section2/rgncw:GoodsNumeric"/>
										</xsl:if>
										<xsl:if test="rgncw:Section2/rgncw:CompletedProcDoc">
											<xsl:text> / </xsl:text>
											<xsl:apply-templates select="rgncw:Section2/rgncw:CompletedProcDoc"/>
										</xsl:if>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:GoodsTNVEDCode"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section2/rgncw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section3/rgncw:CompletionConfirmDoc"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section3/rgncw:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section3/rgncw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section3/rgncw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section4/rgncw:ProtocolDetails" mode="doc"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section4/rgncw:IssuanceDate" mode="russian_date"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section5/rgncw:GrossWeightQuantity"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Section5/rgncw:SupplementaryQuantity"/>
									</td>
									
									<td class="bordered">
										<xsl:apply-templates select="rgncw:Notes"/>
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
									<xsl:apply-templates select="rgncw:ApplicantSignature/cat_ru:PersonPost"/>
								</td>
								<td width="10%"></td>
								<td width="15%"></td>
								<td width="10%"></td>
								<td width="30%">
									<xsl:for-each select="rgncw:ApplicantSignature/*[contains(local-name(), 'ame')]">
										<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
								<td width="10%"></td>
								<td width="15%">
									<xsl:apply-templates select="rgncw:ApplicantSignature/cat_ru:IssueDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td class="descr" style="border-top: 1px solid black;">(должность)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(подпись руководителя организации или уполномоченного лица, либо физического лица)</td>
								<td></td>
								<td class="descr" style="border-top: 1px solid black;">(фамилия, имя, отчество (при наличии)</td>
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
	
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">			
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rgncw:GTDNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<!-- Шаблон для типа rgncw:OrganizationInfoType -->
	<xsl:template match="rgncw:Organization">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="RUScat_ru:Address" mode="address"/>
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
	<!-- Шаблон для типа rgncw:SuppQuantityType -->
	<xsl:template match="rgncw:SupplementaryQuantity">
		<xsl:apply-templates select="rgncw:GoodsQuantity" mode="translate_number"/>
		<xsl:if test="rgncw:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="rgncw:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="rgncw:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="rgncw:MeasureUnitQualifierCode"/>
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
	<xsl:template match="//*[local-name()='RepGoodsNoCustomsWarehouse']//*" priority="-1">
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
