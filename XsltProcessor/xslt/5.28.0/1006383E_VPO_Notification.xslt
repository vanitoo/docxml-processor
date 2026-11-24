<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:vpon="urn:customs.ru:Information:RegistrationDocuments:VPO_Notification:5.26.0">
	<!-- Шаблон для типа VPO_NotificationType -->
	<xsl:template match="vpon:VPO_Notification">
		<xsl:param name="w" select="210"/>
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
                  .borderBottom {
					  border-bottom: 1px solid black;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr style="font-size: 11pt;">
								<td align="right"><b>Калининградский почтовый таможенный пост ЦПТ</b><br/><br/></td>
							</tr>
							<tr>
								<td align="center">
									<font size="4">
										<b>УВЕДОМЛЕНИЕ № <xsl:apply-templates select="vpon:NotifRegNum"/></b>
										<br/>
										<br/>
										<xsl:text>оператору почтовой связи</xsl:text>
										<br/>
										<b>
											<u>
												<xsl:text>АО «Почта России», ОСП  КМСЦ  УФПС Калининградской области</xsl:text>
											</u>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td style="text-align: justify; text-justify: auto;">
									<xsl:text>для допуска к дальнейшей пересылке товаров, находящихся в почтовом(ых) отправлении(ях) № </xsl:text>
									<span class="borderBottom">
										<xsl:for-each select="vpon:VPO_Number">
											<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</span>
									<xsl:text>, </xsl:text>
									<xsl:text>отправителем которых указан </xsl:text>
									<span class="borderBottom">
										<xsl:for-each select="vpon:VPOSender/*">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</span>
									<xsl:text> в целях реализации положений статьи 310 Таможенного кодекса Евразийского экономического союза, для обеспечения требований пункта 28 статьи 455 Таможенного кодекса Евразийского экономического союза,</xsl:text>
									<b>
										<xsl:text> отправителю необходимо обратиться с ПАСПОРТОМ на Калининградский почтовый таможенный пост Центральной почтовой таможни по адресу: г.Калининград, ул.Железнодорожная, №29 для предоставления объяснений.</xsl:text>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table style="font-size: 10pt;">
						<tbody>
							<tr valign="bottom">
								<td>
									Уполномоченное должностное лицо таможенного органа
									<br/>
									"Калининградский почтовый таможенный пост ЦПТ"
								</td>
								<td width="1%"/>
								<td width="30%" class="borderBottom" align="center">
									<xsl:apply-templates select="vpon:CustomsPerson/cat_ru:PersonName"/>
								</td>
								<td width="1%"/>
								<td width="15%" class="borderBottom" align="right">
									<xsl:apply-templates select="vpon:CustomsPerson/cat_ru:LNP"/>
									<!--xsl:if test="vpon:CustomsPerson/cat_ru:CustomsCode">
										<xsl:text> (код ТО: </xsl:text>
										<xsl:apply-templates select="vpon:CustomsPerson/cat_ru:CustomsCode"/>
										<xsl:text>)</xsl:text>
									</xsl:if-->
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td>(Ф.И.О)</td>
								<td></td>
								<td>(Подпись, ЛНП)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:if test="vpon:CustomsInspDateTime">
						<table width="100%">
							<tbody>
								<tr>
									<td align="right">
										<table style="width: 60mm;font-size: 10pt;">
											<tbody>
												<tr>
													<td class="bordered" align="center">
														<xsl:text>Таможенный осмотр проведен</xsl:text>
														<table>
															<tbody>
																<tr align="center">
																	<td class="borderBottom">
																		<xsl:apply-templates select="vpon:CustomsInspDateTime" mode="russian_date"/>
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="substring(vpon:CustomsInspDateTime, 12, 8)"/>
																	</td>
																</tr>
																<tr align="center">
																	<td style="font-size:8pt;">(дата, время)</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа vpon:NotifRegNumType -->
	<xsl:template match="vpon:NotifRegNum">
		<xsl:apply-templates select="vpon:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="vpon:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="vpon:NotifNumber"/>
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
	
	<xsl:template match="//*[local-name()='VPO_Notification']//*" priority="-1">
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
