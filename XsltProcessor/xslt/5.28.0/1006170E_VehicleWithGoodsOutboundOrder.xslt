<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:vwgoo="urn:customs.ru:Information:CustomsDocuments:VehicleWithGoodsOutboundOrder:5.28.0">
	<!-- Шаблон для типа VehicleWithGoodsOutboundOrderType -->
	<xsl:template match="vwgoo:VehicleWithGoodsOutboundOrder">
		<xsl:param name="w" select="190"/>
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
									<b>Предписание о выезде транспортного<br/>средства с находящимися в нем товарами за пределы территории<br/>Российской Федерации</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%" align="left">
									<xsl:call-template name="month_date">
										<xsl:with-param name="date" select="vwgoo:DocDate"/>
									</xsl:call-template>
								</td>
								<td width="50%" align="right">
									<xsl:text>№ </xsl:text>
									<span style="display: inline-block; width: 40mm; text-align: center; border-bottom: 1px solid black;">
										<xsl:apply-templates select="vwgoo:DocNumber"/>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>1. Дата, время и место остановки автомобильного транспортного средства:</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="vwgoo:StopDateTime" mode="russian_date"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(vwgoo:StopDateTime, 12, 8)"/>
									<xsl:text> </xsl:text>
									<xsl:for-each select="vwgoo:StopLocation/*">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(район, населенный пункт, наименование пункта пропуска, учетный номер автодороги)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>2. Регистрационный номер автомобильного транспортного средства и прицепа (полуприцепа):</div>
					<span style="display: inline-block; border-bottom: 1px solid black;">
						<xsl:apply-templates select="vwgoo:TransportMeansRegId"/>
						<xsl:if test="vwgoo:TrailerCode">
							<xsl:text>, прицеп (полуприцеп) </xsl:text>
							<xsl:apply-templates select="vwgoo:TrailerCode"/>
						</xsl:if>
					</span>
					<br/>
					<br/>
					<div>3. Основание выдачи настоящего предприсания<sup>*</sup>:</div>
					<span style="display: inline-block; width:4mm; height: 4mm; border: 1px solid black; text-align: center;">
						<xsl:if test="vwgoo:IssuingOrderReason = 1">x</xsl:if>
					</span>
					<xsl:text> - отсутствие визуализированной ссылки;</xsl:text>
					<br/>
					<span style="display: inline-block; width:4mm; height: 4mm; border: 1px solid black; text-align: center;">
						<xsl:if test="vwgoo:IssuingOrderReason = 2">x</xsl:if>
					</span>
					<xsl:text> - отсутствие у документа о предстоящей поставке товаров статуса, необходимого для ввоза товаров;</xsl:text>
					<br/>
					<span style="display: inline-block; width:4mm; height: 4mm; border: 1px solid black; text-align: center;">
						<xsl:if test="vwgoo:IssuingOrderReason = 3">x</xsl:if>
					</span>
					<xsl:text> - несоответствие сведений, указанных в документе о предстоящей поставке товаров, сведениям, указанным в документах, представленных перевозчиком.</xsl:text>
					<br/>
					<br/>
					<div>4. Выезд транспортного средства с находящимися в нем товарами за пределы территории Российской Федерации обеспечить в срок до:</div>
					<xsl:apply-templates select="vwgoo:DepartureDate" mode="russian_date"/>
					<br/>
					<br/>
					<div>5. Должностное лицо таможенного органа, составившее настоящее предприсание:</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value">
									<xsl:if test="vwgoo:CustomsPerson/cat_ru:PersonPost">
										<xsl:apply-templates select="vwgoo:CustomsPerson/cat_ru:PersonPost"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:for-each select="vwgoo:CustomsPerson/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(наименование должности, фамилия, имя, отчество (при наличии), подпись должностного лица таможенного органа)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>6. Настоящее предприсание получил:</div>
					<table class="inlinetable" style="min-width: 100%; width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value">
									<xsl:if test="vwgoo:ReceivedOrderPerson/vwgoo:DateTimeReceipt">
										<xsl:apply-templates select="vwgoo:ReceivedOrderPerson/vwgoo:DateTimeReceipt" mode="russian_date"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(vwgoo:ReceivedOrderPerson/vwgoo:DateTimeReceipt, 12, 8)"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:for-each select="vwgoo:ReceivedOrderPerson/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(дата, время получения настоящего предприсания, фамилия, имя, отчество (при наличии), подпись лица, управляющего автомобильным транспортным средством)
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="vwgoo:DocNumber">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="reg_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[4]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
	</xsl:template>
	
	<xsl:template name="month_date">
		<xsl:param name="date"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="month" select="substring($date, 6,2)"/>
			<xsl:text>"</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 9, 2)"/>
			</span>
			<xsl:text>" </xsl:text>
			<span style="display: inline-block; width: 25mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:choose>
					<xsl:when test="$month = '01'">января</xsl:when>
					<xsl:when test="$month = '02'">февраля</xsl:when>
					<xsl:when test="$month = '03'">марта</xsl:when>
					<xsl:when test="$month = '04'">апреля</xsl:when>
					<xsl:when test="$month = '05'">мая</xsl:when>
					<xsl:when test="$month = '06'">июня</xsl:when>
					<xsl:when test="$month = '07'">июля</xsl:when>
					<xsl:when test="$month = '08'">августа</xsl:when>
					<xsl:when test="$month = '09'">сентября</xsl:when>
					<xsl:when test="$month = '10'">октября</xsl:when>
					<xsl:when test="$month = '11'">ноября</xsl:when>
					<xsl:when test="$month = '12'">декабря</xsl:when>
				</xsl:choose>
			</span>
			<xsl:text> 20</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 3, 2)"/>
			</span>
			<xsl:text>г.</xsl:text>
		</element>
	</xsl:template>
	<xsl:template name="reg_date">
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
	<xsl:template match="//*[local-name()='VehicleWithGoodsOutboundOrder']//*" priority="-1">
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
	<xsl:template match="*" mode="reg_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="reg_date">
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
