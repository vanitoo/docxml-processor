<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pn="urn:customs.ru:Information:CommercialFinanceDocuments:PercentageNotice:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа PercentageNoticeType -->
	<xsl:template match="pn:PercentageNotice">
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
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
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
										<b>Уведомление об отказе в возврате процентов</b>
									</font>
								</td>
							</tr>
							<tr align="center">
								<td>
									<xsl:if test="pn:PercentageNoticeDate">
										<xsl:text> от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pn:PercentageNoticeDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="pn:PercentageNoticeRegNumber">
										<xsl:text> № </xsl:text>
										<xsl:value-of select="pn:PercentageNoticeRegNumber"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(дата, номер уведомления)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Таможенный орган</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="pn:Customs" mode="spaced"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа, рассматривающего заявление)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>уведомляет об отказе в возврате процентов по заявлению</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="pn:DocCalcPayment" mode="doc"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указывается номер и дата заявления о возврате авансовых платежей)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>о выплате процентов, поданному</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="pn:Organization" mode="org2"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="5%">
													<xsl:text>ИНН</xsl:text>
													<sup>*</sup>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="pn:Organization/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
												</td>
												<td width="5%">
													<xsl:text>КПП</xsl:text>
													<sup>**</sup>
												</td>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="pn:Organization/cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="pn:OffsetSign = 0 or translate(substring(pn:OffsetSign,1,1), 'F', 'f') = 'f'">
									<tr>
										<td>
											<xsl:apply-templates select="pn:RejectionReason"/>
											<br/>
											<xsl:text>В связи с отказом Федерального Казначейства в возврате процентов на банковский счет, зачет процентов произведен на лицевой счет по КБК "Авансовые платежи".</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="50%" colspan="2"/>
								<td width="50%" colspan="2">
										Начальник (заместитель начальника)
										<br/>
										таможенного органа
										<br/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td width="25%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="pn:CustomsChief/cat_ru:IssueDate"/>
									</xsl:call-template>
								</td>
								<td width="25%"/>
								<td width="25%" class="value"/>
								<td width="25%" class="value">
									<xsl:value-of select="pn:CustomsChief/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pn:CustomsChief/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pn:CustomsChief/cat_ru:PersonMiddleName"/>
								</td>
							</tr>
							<tr>
								<td class="descr">(дата)</td>
								<td/>
								<td class="descr">(подпись)</td>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<p align="left" style="font-size: 8pt;">
							____________________________________
							<br/>
						<sup>*</sup> Идентификационный номер налогоплательщика.
							<br/>
						<sup>**</sup> Указывается код причины постановки на учет юридического лица, содержащийся в Едином государственном реестре юридических лиц.
						</p>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="org2">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="."/>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="signature">
		<xsl:param name="post"></xsl:param>
		<br/>
		<table>
			<tbody>
				<tr valign="bottom" align="center">
					<td width="25%" >
						<xsl:value-of select="$post"/>
					</td>
					<td width="2%"></td>
					<td width="20%" class="value"></td>
					<td width="1%"></td>
					<td width="20%" class="value">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IssueDate"/></xsl:call-template>
					</td>
					<td width="2%"></td>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonSurname"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="descr">(подпись)</td>
					<td></td>
					<td class="descr">(дата)</td>
					<td></td>
					<td class="descr">(инициалы, фамилия)</td>
				</tr>
			</tbody>
		</table>
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
	<xsl:template match="//*[local-name()='PercentageNotice']//*" priority="-1">
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
