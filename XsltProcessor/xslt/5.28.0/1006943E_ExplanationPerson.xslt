<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ep="urn:customs.ru:Information:CustomsAuditDocuments:ExplanationPerson:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ns1="urn:customs.ru:RUSCommonLeafTypes:5.21.0">
	<!-- Шаблон для типа ExplanationPersonType -->
	<xsl:template match="ep:ExplanationPerson">
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
					vertical-align:top;
					}
					
				span {
					font-style: italic;
				}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="ep:CustomsName/*">
										<xsl:if test="position()!=1"><xsl:text> (</xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=1"><xsl:text>)</xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td class="graphLittle">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Объяснение</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="25%" align="left">
									<xsl:apply-templates select="ep:ExplanationDate" mode="russian_date_month"/>
									<xsl:if test="not(ep:ExplanationDate)">
										<xsl:call-template name="russian_date_month"/>
									</xsl:if>
								</td>
								<td width="40%" align="right"></td>
								<td width="35%" align="right">
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="ep:ExplanationPlace"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(место дачи объяснений)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="ep:CustomsPerson/cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="ep:CustomsPerson" mode="fio"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(должность, фамилия и инициалы должностного лица таможенного органа, принявшего объяснения)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									в соответствии со статьей  323 Таможенного кодекса Евразийского экономического союза принял объяснения от:
									<br/>
									фамилия <span><xsl:apply-templates select="ep:PersonDetails/cat_ru:PersonSurname"/></span>,<br/>
									имя, отчетство <span><xsl:apply-templates select="ep:PersonDetails/cat_ru:PersonName"/><xsl:text> </xsl:text><xsl:apply-templates select="ep:PersonDetails/cat_ru:PersonMiddleName"/></span>,<br/>
									год рождения <span><xsl:apply-templates select="ep:PersonDetails/ep:BornYear"/></span>,<br/>
									место рождения <span><xsl:apply-templates select="ep:PersonDetails/ep:BornPlace"/></span>,<br/>
									место работы <span><xsl:apply-templates select="ep:PersonDetails/ep:WorkAddress/*" mode="comma"/></span>,<br/>
									место жительства <span><xsl:apply-templates select="ep:PersonDetails/ep:ResidenceAddress/*" mode="comma"/></span>.<br/>
									Документ, удостоверяющий личность
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="ep:PersonDetails/ep:IdentityCard" mode="passport"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование, номер, гражданство, дата выдачи)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<br/>
									По существу заданных вопросов объясняю следующее: <span><xsl:apply-templates select="ep:ExplanationText"/></span>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td width="30%">
												<table class="inlinetable" style="width: 100%;">
													<tbody>
														<tr align="left">
															<td width="100%">
																<xsl:apply-templates select="ep:ExplanationAcceptDate" mode="russian_date_month"/>
																<xsl:if test="not(ep:ExplanationAcceptDate)">
																	<xsl:call-template name="russian_date_month"/>
																</xsl:if>
															</td>
														</tr>
														<tr align="center">
															<td class="descr" width="100%">
																<xsl:text>(дата)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
											<td width="10%"/>
											<td width="60%">
												<table class="inlinetable" style="width: 100%;">
													<tbody>
														<tr align="left">
															<td class="value" width="100%">
																<xsl:apply-templates select="ep:PersonDetails" mode="fio"/>
																<br/>
															</td>
														</tr>
														<tr align="center">
															<td class="descr" width="100%">
																<xsl:text>(подпись, фамилия, инициалы лица, давшего объяснение)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<table>
									<tr>
										<td width="30%">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td width="100%">
															<xsl:apply-templates select="ep:ExplanationAcceptDate" mode="russian_date_month"/>
															<xsl:if test="not(ep:ExplanationAcceptDate)">
																<xsl:call-template name="russian_date_month"/>
															</xsl:if>
														</td>
													</tr>
													<tr align="center">
														<td class="descr" width="100%">
															<xsl:text>(дата)</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="10%"/>
										<td width="60%">
											<table class="inlinetable" style="width: 100%;">
												<tbody>
													<tr align="left">
														<td class="value" width="100%">
															<xsl:apply-templates select="ep:CustomsPerson" mode="fio"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="ep:CustomsPerson/RUScat_ru:LNP"/>
															<br/>
														</td>
													</tr>
													<tr align="center">
														<td class="descr" width="100%">
															<xsl:text>(подпись, фамилия, инициалы должностного лица таможенного органа, личная номерная печать (при наличии))</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</table>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="passport">
		<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
	</xsl:template>
	
	<xsl:template match="*" mode="comma">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>

	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="//*[local-name()='ActCustomsInspPlace']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
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
