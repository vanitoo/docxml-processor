<?xml version="1.0" encoding="UTF-8"?>
<!--DocKind5 - Приказ Министерства финансов Российской Федерации от 22 декабря 2020 N 317н "Об утверждении форм документов, предусмотренных частями 7, 10 и 12 статьи 20 Федерального закона от 13 июля 2020 г. N 193-Ф3 "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации"
Приложение N 3 - Уведомление об отказе таможенного органа в выдаче разрешения на вывоз товаров
-->
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:nvl="urn:customs.ru:Information:ExchangeDocuments:OEZ_NotifViolation:5.25.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" method="html" omit-xml-declaration="yes" version="1.0"/>
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
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Уведомление об отказе в выдаче разрешения на ввоз (вывоз) товаров</title>
				<style type="text/css">
                    td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                       font-weight: bold; 
                    }
                    td.graphNormal {
                        border-bottom: 1px solid black;
                        font-weight: normal; 
                    }
                       td.graphLit {
                         text-align: center;
                       font-weight: normal; 
                        font-size: 7pt;
                    }

                    td.graph {
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    div.org {
                        text-align: center;
                        border: none;
                    }

                    table.declarant td.right {
                        padding-left: 10px;
                        border-bottom: 1px solid black;
                        padding-bottom: 0px;
                    }

                    body {
                        text-align: center;
                        background: #cccccc;
                        font-family: Arial;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        margin-left: auto;
                        margin-right: auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;
                        text-align: left;
                    }

					div.page {
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					text-align: left
					}

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  vertical-align:bottom;
                  }

					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}

                    h2 {
                        font-size: 14;
                        font-weight: bold;
                        text-align: center;
                    }

                    span {
                        text-decoration: underline;
                    }

                    h3 {
                        text-align: left;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                    }

                    table {
                        margin: auto;
                        border-collapse: collapse;
                    }
                    .bordered {
						border: 1px solid black;
                    }
                </style>
			</head>
			<body>
				<xsl:apply-templates select="nvl:OEZ_NotifViolation"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="doc_num">
		<u>
			<xsl:apply-templates select="nvl:CustomsCode"/>
		</u>
		<xsl:text>/</xsl:text>
		<u>
			<xsl:apply-templates select="nvl:RegistrationDate" mode="gtd_date"/>
		</u>
		<xsl:text>/</xsl:text>
		<u>
			<xsl:apply-templates select="nvl:Number"/>
		</u>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="nvl:Abbreviation"/>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="cat_ru:IssueDate">
		<table>
			<tbody>
				<tr>
					<td class="graphUnderline">
						<xsl:call-template name="date">
							<xsl:with-param name="text" select="."/>
						</xsl:call-template> г.
                    </td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="date">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
				<xsl:value-of select="substring($text,9,2)"/>.<xsl:value-of select="substring($text,6,2)"/>.<xsl:value-of select="substring($text,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="nvl:Customs">
		<table>
			<tr>
				<td class="graphUnderline">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Код таможенного органа</td>
			</tr>
			<tr>
				<td class="graphUnderline">
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
			<tr>
				<td class="graph">Наименование таможенного органа</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="Organisation">
		<xsl:param name="base"/>
		<table style="width: 100%">
			<tr>
				<td class="graphUnderline">
					<xsl:value-of select="$base/cat_ru:OrganizationName"/>
					<xsl:if test="$base/cat_ru:ShortName">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="$base/cat_ru:ShortName"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td class="graph">Наименование организации / ФИО физического
                    лица
                </td>
			</tr>
			<xsl:if test="$base/cat_ru:OGRN or $base/cat_ru:RFOrganizationFeatures/cat_ru:INN or $base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<tr>
					<td class="graphUnderline">
						<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
							<xsl:text>ОГРН: </xsl:text>
							<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
						</xsl:if>
						<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN">
							<xsl:text> ИНН: </xsl:text>
							<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
						</xsl:if>
						<xsl:if test="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP">
							<xsl:text> КПП: </xsl:text>
							<xsl:value-of select="$base/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="graph">Реквизиты</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
					<xsl:text>(срок действия: до   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">,&#032;<xsl:if test="string-length(cat_ru:INN) &gt; 0">ИНН<span class="italic"/>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">/</xsl:if>
			<xsl:if test="string-length(cat_ru:KPP) &gt; 0">КПП</xsl:if>:&#032;</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">&#032;/&#032;</xsl:if>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">,&#032;ОГРН:&#032;<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization_base" match="*">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">(<xsl:apply-templates select="cat_ru:ShortName"/>)</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template match="nvl:Declarant_OEZ">
		<table align="center" border="0">
			<tbody>
				<tr title="Наименование организации / ФИО физического лица">
					<td class="graphUnderline">
						<xsl:value-of select="cat_ru:OrganizationName"/>
					</td>
				</tr>
				<tr title="Наименование организации / ФИО физического лица">
					<td class="graph">
						<xsl:text>Наименование резидента</xsl:text>
						<xsl:choose>
							<xsl:when test="//nvl:DocSign='0'"> ОЭЗ (нерезидента ОЭЗ)</xsl:when>
							<xsl:when test="//nvl:DocSign='1'"> ПОЭЗ</xsl:when>
							<xsl:when test="//nvl:DocSign='2'"> ТОСЭР</xsl:when>
							<xsl:when test="//nvl:DocSign='3'"> ОЭЗ Арктика</xsl:when>
							<xsl:when test="//nvl:DocSign='4'"> ПОЭЗ Арктика</xsl:when>
						</xsl:choose>
						<xsl:text>, лица, действующего по его поручению </xsl:text>
					</td>
				</tr>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
					<tr title="ОГРН/ОГРНИП">
						<td class="graphUnderline">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
						</td>
					</tr>
					<tr title="ОГРН/ОГРНИП">
						<td class="graph">ОГРН/ОГРНИП:</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
					<tr title="ИНН">
						<td class="graphUnderline">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
						</td>
					</tr>
					<tr title="ИНН">
						<td class="graph">ИНН:</td>
					</tr>
				</xsl:if>
				<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
					<tr title="КПП">
						<td class="graphUnderline">
							<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
						</td>
					</tr>
					<tr title="КПП">
						<td class="graph">КПП:</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	<!--Подпись-->
	<xsl:template name="signature">
		<xsl:param name="base"/>
		<xsl:value-of select="$base/cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$base/cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$base/cat_ru:PersonMiddleName"/>
		<xsl:if test="$base/cat_ru:PersonPost">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="$base/cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:text>. </xsl:text>
		<xsl:if test="$base/cat_ru:IssueDate">
			<xsl:call-template name="date">
				<xsl:with-param name="text" select="$base/cat_ru:IssueDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="nvl:OEZ_NotifViolation">
		<xsl:choose>
			<xsl:when test="nvl:DocKind='5'">
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td align="left" width="45%" valign="bottom">№ <xsl:apply-templates select="nvl:NotifRegNum" mode="doc_num"/>
												</td>
												<td align="center" width="55%" class="value">
													<xsl:for-each select="nvl:Declarant_OEZ">
														<xsl:apply-templates select="cat_ru:OrganizationName"/>
														<xsl:if test="cat_ru:ShortName">
															<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
															<xsl:apply-templates select="cat_ru:ShortName"/>
															<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>наименование юридического лица или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, являющегося резидентом Арктической зоны Российской Федерации) </xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Уведомление</xsl:text>
											<br/>
											<xsl:text>об отказе таможенного органа в выдаче разрешения на вывоз товаров, помещенных под таможенную процедуру свободной таможенной зоны, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру свободной таможенной зоны, с территории Арктической зоны Российской Федерации, на которой применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза без завершения действия таможенной процедуры свободной таможенной зоны для совершения операций, предусмотренных подпунктом 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза </xsl:text>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="38%">Настоящее уведомление выдано</td>
												<td width="62%" class="value">
													<xsl:apply-templates mode="organization_base" select="nvl:Declarant_OEZ"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates mode="Certificate" select="nvl:ResidentCertificate"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(наименование юридического лица или фамилия, имя, отчество (при наличии) индивидуального предпринимателя, являющегося резидентом Арктической зоны Российской Федерации, с указанием идентификационного номера налогоплательщика (ИНН), реквизиты свидетельства о включении в реестр резидентов Арктической зоны Российской Федерации)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>и свидетельствует о невозможности вывоза с территории Арктической зоны Российской Федерации, на которой применяется таможенная процедура свободной таможенной зоны, на остальную часть таможенной территории Евразийского экономического союза товаров по заявлению N </xsl:text>
									<xsl:apply-templates mode="doc_num" select="nvl:AppRegNum"/> на основании части 2 статьи 205 Федерального закона от 13 июля 2020 г. N 193-ФЗ "О государственной поддержке предпринимательской деятельности в Арктической зоне Российской Федерации" для целей совершения в отношении товаров операций, предусмотренных подпунктом 5 пункта 4 статьи 205 Таможенного кодекса Евразийского экономического союза по следующим основаниям:</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="nvl:MotiveProhibition">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom">
												<td class="value" width="25%"/>
												<td width="15%"/>
												<td class="value" width="15%"/>
												<td width="15%"/>
												<td class="value" width="30%">
													<xsl:apply-templates select="nvl:CustomsPerson/cat_ru:PersonName"/>
												</td>
											</tr>
											<tr>
												<td class="graphLittle">(начальник таможенного органа) </td>
												<td/>
												<td class="graphLittle">(подпись)</td>
												<td/>
												<td class="graphLittle">(фамилия, имя, отчество (при наличии) </td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</xsl:when>
			<xsl:when test="nvl:DocKind='13'">
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Уведомление об отказе в выдаче разрешения на вывоз товаров</xsl:text>
											<xsl:if test="nvl:NotifRegNum">
												<br/>
												<xsl:text>№ </xsl:text>
												<xsl:apply-templates select="nvl:NotifRegNum" mode="doc_num"/>
											</xsl:if>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr valign="bottom">
												<td align="left" width="40%" valign="bottom" class="value">
													<xsl:apply-templates select="nvl:Customs/cat_ru:OfficeName"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="nvl:Customs/cat_ru:Code"/>
												</td>
												<td width="10%"/>
												<td align="center" width="50%" class="value">
													<xsl:for-each select="nvl:Declarant_OEZ">
														<xsl:apply-templates select="cat_ru:OrganizationName"/>
														<xsl:if test="cat_ru:ShortName">
															<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
															<xsl:apply-templates select="cat_ru:ShortName"/>
															<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
														</xsl:if>
													</xsl:for-each>
													<xsl:if test="nvl:Declarant_OEZ/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:text>, ИНН </xsl:text><xsl:apply-templates select="nvl:Declarant_OEZ/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
												</td>
											</tr>
											<tr valign="top">
												<td class="graphLittle">(наименование таможенного органа)</td>
												<td/>
												<td class="graphLittle">
													<xsl:text>(полное наименование юридического лица - для юридического лица; фамили, имя отчество (приналичии) - для физического лица; идентрификационный номер налогоплательщика)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Настоящим уведомляем, что таможенным органом принято решение о невозможноси выдачи разрешения на вывоз товаров по уведомлению о вывозе товаров № </xsl:text>
									<xsl:apply-templates mode="doc_num" select="nvl:AppRegNum"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr align="center" valign="top">
												<td class="bordered">№ п/п</td>
												<td class="bordered">Наименование товара (согласно уведомлению о вывозе товаров)</td>
												<td class="bordered">Номер товара из уведомления о вывозе товаров</td>
											</tr>
											<tr align="center">
												<td class="bordered">1</td>
												<td class="bordered">2</td>
												<td class="bordered">3</td>
											</tr>
											<xsl:for-each select="nvl:GoodsInfo">
												<tr valign="top">
													<td class="bordered">
														<xsl:apply-templates select="nvl:Position"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="nvl:GoodsDescription"/>
													</td>
													<td class="bordered">
														<xsl:apply-templates select="nvl:NotifPosition"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td>
									<xsl:text>по следующим причинам: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:apply-templates select="nvl:MotiveProhibition"/>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
								(указываются причины, по которым принято решение о невозможности выдачи разрешения на вывоз)
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/></td>
							</tr>
							<tr>
								<td>
									<xsl:text>Вам необходимо совершить следующие действия и (или) представить в таможенный орган следующие документы и сведения:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="bordered">
									<xsl:if test="nvl:NecessityActivity">
										<xsl:text>Действия: </xsl:text>
										<br/>
										<xsl:apply-templates select="nvl:NecessityActivity"/>
										<br/>
										<br/>
									</xsl:if>
									<xsl:if test="nvl:ListDocumentInformation">
										<xsl:text>Документы и сведения: </xsl:text>
										<br/>
										<xsl:apply-templates select="nvl:ListDocumentInformation"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="graphLittle">
								(указываюся действия, которые необходимо совершить в отношении товаров, в том числе тренспортных средств, и (или) документы и сведения, которые необходимо представить в уполномоченный таможенный орган для принятия решения о выдче разрешения на вывоз)
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr valign="bottom">
												<td class="value bordered" width="70%">
													<xsl:apply-templates select="nvl:CustomsPerson/cat_ru:PersonPost"/>
													<br/>
													<xsl:for-each select="nvl:CustomsPerson/*[contains(local-name(), 'ame')]">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</td>
												<td width="10%"/>
												<td class="value bordered" width="20%"/>
											</tr>
											<tr>
												<td class="graphLittle">(Должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа) </td>
												<td/>
												<td class="graphLittle">(подпись)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="pagePortrait">
					<h2>
						<xsl:choose>
							<xsl:when test="nvl:DocKind = 1">Уведомление<br/>об отказе в выдаче разрешения на ввоз (вывоз) товаров </xsl:when>
							<xsl:when test="nvl:DocKind = 2">Уведомление<br/>об отказе в выдаче разрешения на передачу товаров</xsl:when>
							<xsl:when test="nvl:DocKind = 3">Уведомления<br/>о продлении срока рассмотрения Заявления о передаче товаров</xsl:when>
							<xsl:when test="nvl:DocKind = 4">Уведомление<br/>о непредставлении документов</xsl:when>
							<xsl:when test="nvl:DocKind = 6">Решение<br/>о продлении срока переработки</xsl:when>
							<xsl:when test="nvl:DocKind = 7">Решение<br/>о не продлении срока переработки</xsl:when>
							<xsl:when test="nvl:DocKind = 8">Уведомление<br/>о продлении срока рассмотрения Заявления о завершении действия СТЗ (оборудование и товары, используемые для строительства объектов недвижимости)</xsl:when>
							<xsl:when test="nvl:DocKind = 9">Уведомление<br/>о продлении срока рассмотрения Заявления о завершении действия СТЗ (потребленные товары)</xsl:when>
							<xsl:when test="nvl:DocKind = 10">Уведомление<br/>об отказе в выдаче разрешения на вывоз товаров, помещенных под таможенную процедуру СТЗ</xsl:when>
							<xsl:when test="nvl:DocKind = 11">Решение<br/>таможенного органа о продлении срока обратного ввоза</xsl:when>
							<xsl:when test="nvl:DocKind = 12">Решение<br/>таможенного органа о не продлении срока обратного ввоза</xsl:when>
						</xsl:choose>
					</h2>
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="left" colspan="3">
									<xsl:apply-templates select="nvl:CustomsPerson/cat_ru:IssueDate"/>
								</td>
							</tr>
							<tr>
								<td align="left" style="width:65mm">
									<xsl:apply-templates select="nvl:Customs"/>
								</td>
								<td align="left" style="width:50mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="right" style="width:65mm">
									<xsl:apply-templates select="nvl:Declarant_OEZ"/>
								</td>
							</tr>
							<tr>
								<td align="left" colspan="3" style="text-intend : 30pt;">
									<xsl:choose>
										<xsl:when test="nvl:DocKind = 8 or nvl:DocKind = 9">
											<xsl:text>Настоящим уведомляем, что уполномоченным таможенным органом принято решение о продлении срока рассмотрения Заявления о завершении действия СТЗ</xsl:text>
											<xsl:if test="nvl:RenewalPeriod">
												<xsl:text> до </xsl:text>
												<xsl:apply-templates select="nvl:RenewalPeriod" mode="russian_date"/>
											</xsl:if>
											<xsl:if test="nvl:ProlongReason">
												<xsl:text> по следующим причинам: </xsl:text>
												<xsl:apply-templates select="nvl:ProlongReason"/>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											Настоящим уведомляем, что уполномоченным таможенным органом принято решение о невозможности выдачи разрешения на
											<xsl:choose>
												<xsl:when test="//nvl:DocSign='1'">ввоз/вывоз</xsl:when>
												<xsl:otherwise>вывоз</xsl:otherwise>
											</xsl:choose> следующих товаров:
										</xsl:otherwise>
									</xsl:choose>
									
									</td>
							</tr>
						</tbody>
					</table>
					<xsl:choose>
						<xsl:when test="nvl:DocKind != 8 and nvl:DocKind != 9">
							<table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
								<tbody>
									<tr>
										<td align="center" style="width:10mm">
									№ п/п
									</td>
										<td align="center" style="width:180mm">
									Наименование товара
									</td>
									</tr>
									<tr>
										<td align="center" style="width:10mm">
									1
									</td>
										<td align="center" style="width:180mm">
									2
									</td>
									</tr>
									<xsl:for-each select="nvl:GoodsInfo">
										<tr>
											<td align="center" style="width:10mm">
												<xsl:value-of select="nvl:Position"/>
											</td>
											<td align="left" style="width:180mm">
												<xsl:for-each select="nvl:GoodsDescription">
													<xsl:value-of select="."/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
								<tbody>
									<tr>
										<td align="left" style="width:190mm">
									по следующим причинам:
									</td>
									</tr>
									<xsl:for-each select="nvl:MotiveProhibition">
										<tr>
											<td align="left" class="graphNormal" style="width:190mm">
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td align="left" class="graphLit" style="width:190mm">
									(указываются причины, по которым принято решение о невозможности выдачи разрешения на <xsl:choose>
												<xsl:when test="//nvl:DocSign='1'">ввоз (вывоз)</xsl:when>
												<xsl:otherwise>вывоз</xsl:otherwise>
											</xsl:choose>)
									</td>
									</tr>
									<tr>
										<td align="left" style="width:190mm">
									Вам необходимо: <br/>
									1) совершить следующие действия в отношении товаров и средств транспорта, перевозящих такие товары
									</td>
									</tr>
									<xsl:for-each select="nvl:NecessityActivity">
										<tr>
											<td align="left" class="graphNormal" style="width:190mm">
												<xsl:value-of select="."/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td align="left" style="width:190mm">
									2) представить в уполномоченный таможенный орган документы и сведения
									</td>
									</tr>
									<xsl:for-each select="nvl:ListDocumentInformation">
										<tr>
											<td align="left" class="graphNormal" style="width:190mm">
												<xsl:value-of select="cat_ru:PrDocumentName"/>
												<xsl:if test="cat_ru:PrDocumentNumber"> №
											<xsl:value-of select="cat_ru:PrDocumentNumber"/>
												</xsl:if> 
										<xsl:if test="cat_ru:PrDocumentDate">от
											<xsl:call-template name="date">
														<xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="nvl:AddInformation">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:for-each select="nvl:AddInformation">
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:if>
									;<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							
						</xsl:when>
					</xsl:choose>
					
					<table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
						<tbody>
							<tr>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</tr>
							<tr>
								<td align="center" class="graphNormal" style="width:80mm">
									<xsl:value-of select="nvl:CustomsPerson/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="nvl:CustomsPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="nvl:CustomsPerson/cat_ru:PersonMiddleName"/>
								</td>
								<td style="width:60mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="graphNormal" style="width:50mm">
									<xsl:if test="nvl:CustomsPerson/cat_ru:LNP">
										<xsl:value-of select="nvl:CustomsPerson/cat_ru:LNP"/>
										<xsl:if test="nvl:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="nvl:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLit" style="width:80mm">
						ФИО должностного лица таможенного органа 
						</td>
								<td style="width:60mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graphLit" style="width:50mm">ЛНП</td>
							</tr>
						</tbody>
					</table>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="nvl:ListDocumentInformation">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="nvl:AddInformation">
			<xsl:text> Сведения: </xsl:text>
			<xsl:apply-templates select="nvl:AddInformation"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
