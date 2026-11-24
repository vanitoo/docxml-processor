<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:mpoea="urn:customs.ru:Information:CustomsDocuments:MailManifest:5.28.0">
	<!-- Шаблон для типа MailManifestType -->
	<xsl:template match="mpoea:MailManifest">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  font-size: 11pt;
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
                  
                  .val
                  {
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
								<td align="center" class="title">
									<font size="4">
										<b>ПОЧТОВЫЙ МАНИФЕСТ</b>
										<br/>
										<b>Mail Manifest</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" class="bordered graphMain annot" width="33%">
									<xsl:text>№ рейса: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:Reestr_ID"/></span>
								</td>
								<td colspan="2" class="bordered graphMain annot" width="33%">
									<xsl:text>Дата</xsl:text><br/><xsl:text>прилета: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:ArrivalDateTime" mode="russian_date"/></span>
								</td>
								<td colspan="2" class="bordered graphMain annot" width="34%">
									<xsl:text>Время</xsl:text><br/><xsl:text>прилета: </xsl:text>
									<span class="val"><xsl:value-of select="substring(mpoea:ArrivalDateTime, 12, 8)"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Пункт вылета: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:DeparturePoint"/></span>
								</td>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Пункт выгрузки: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:UnloadingPoint"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Тип ВС: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:AircraftTypet"/></span>
								</td>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Номер борта ВС: </xsl:text>
									<span class="val"><xsl:apply-templates select="mpoea:FlightNumber"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Общее количество почты (мест/uld - вес)</xsl:text>
									<br/>
									<br/>
									<span class="val" style="display:inline-block; width:20mm;text-align:center;">
										<xsl:apply-templates select="mpoea:TotalPlaces"/>
									</span>
									<xsl:text>м / </xsl:text>
									<span class="val" style="display:inline-block; width:20mm;text-align:center;">
										<xsl:apply-templates select="mpoea:TotalWeight"/>
									</span>
									<xsl:text>кг</xsl:text>
								</td>
								<td colspan="3" class="bordered graphMain annot" width="50%">
									<xsl:text>Номер ULD с почтой: </xsl:text>
									<br/>
									<span class="val">
										<xsl:for-each select="mpoea:ULD_Numbers">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Почта выгружена из ВС в количестве </xsl:text>
					<span class="val" style="display:inline-block; width: 20mm; text-align: center; border-bottom: 1px solid black;">
						<xsl:apply-templates select="mpoea:TotalPlaces"/>
					</span>
					<xsl:text> мест и/или в </xsl:text>
					<span class="val" style="display:inline-block; width: 20mm; text-align: center; border-bottom: 1px solid black;">
						<xsl:apply-templates select="mpoea:TotalWeight"/>
					</span>
					<xsl:text> ULD</xsl:text>
					<br/>
					<xsl:text>грузчиком</xsl:text>
					<br/>
					<table class="inlinetable" style="min-width: 80mm; width: 80mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="mpoea:Loader/mpoea:OrganizationName"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									наименование организации
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text> </xsl:text>
					<table class="inlinetable" style="min-width: 60mm; width: 60mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="mpoea:Loader/mpoea:Person/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									Ф.И.О.
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>/</xsl:text>
					<table class="inlinetable" style="width: 40mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									Подпись
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>/</xsl:text>
					<br/>
					<br/>
					<xsl:text>Наличие неисправностей при перевозке почты: </xsl:text>
					<span class="val" style="min-width: 100mm; width: 100mm; border-bottom: 1px solid black;">
						<xsl:apply-templates select="mpoea:MalfunctionSign"/>
					</span>
					<br/>
					<br/>
					<div style="display: inline-block; min-height: 20mm; width: 100%; border: 1px solid black;">
						<b>Отметки таможенного органа: </b>
						<br/>
						<span class="val"><xsl:apply-templates select="mpoea:CustomsMarks"/></span>
					</div>
					<br/>
					<br/>
					<br/>
					<div style="text-align: center;" class="descr">
						На борту судна отсутствуют товары, ввоз которых на таможенную территорию ЕАЭС<br/>
						запрещен или ограничен, лекарственные средства, в состав которых входят наркотические,<br/>
						сильнодействующие средства, психотропные и ядовитые вещества, оружие, боеприпасы.
					</div>
					<br/>
					<br/>
					<br/>
					<b>Почтовый манифест заполнен </b>
					<table class="inlinetable" style="width: 80mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="mpoea:CompletedDocPerson/mpoea:Person/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
									<xsl:if test="mpoea:CompletedDocPerson/mpoea:Person/cat_ru:PersonPost">
										<xsl:text>, </xsl:text>
										<xsl:apply-templates select="mpoea:CompletedDocPerson/mpoea:Person/cat_ru:PersonPost"/>
									</xsl:if>
									<xsl:text>, </xsl:text>
									<xsl:apply-templates select="mpoea:CompletedDocPerson/mpoea:OrganizationName"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									Ф.И.О.
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>/</xsl:text>
					<table class="inlinetable" style="width: 30mm;">
						<tbody>
							<tr align="center">
								<td class="value">
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									Подпись
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text>/</xsl:text>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mpoea:MalfunctionSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1 or translate(substring(., 1, 1), 't', 'T') = 'T'">неисправности обнаружены</xsl:when>
				<xsl:when test=". = 0 or translate(substring(., 1, 1), 'f', 'F') = 'F'">неисправности отсутствуют</xsl:when>
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
	<xsl:template match="//*[local-name()='MailManifest']//*" priority="-1">
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
