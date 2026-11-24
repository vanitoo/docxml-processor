<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rrqo cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:rrqo="urn:customs.ru:Information:ExchangeDocuments:RejectReqOperation:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="rrqo:RejectReqOperation">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Отказ в запрашиваемых действиях</title>
				<style type="text/css">
				body {
					text-align: center;
						background: #cccccc;
						}
						
					div.page {
						width: 210mm;
						height: 297mm;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding:	10mm;
						padding-left:	20mm;
						background: #ffffff;
						border: solid 1pt #000000;
						}
						
					.bordered {
						border: solid 1pt #000000;
						padding-top:4pt;
						padding-bottom:4pt;
						font-family: Arial;
						font-size: 9pt;
						font-weight: bold;
						}
						
					.underlined {
						border-bottom: solid 0.8pt #000000;
						}
						
					p.NumberDate {
						font-weight: bold;
						}
						
					.graph {
						font-family: Arial;
						font-size: 10pt;
						}
					td {
						font-family:Courier;
						}
	
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
						
						.graphLittle {
						font-family: Arial;
						font-size: 9pt;
						}
						
						.graphNo {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
					
					pre {
						white-space: pre-wrap;       /* css-3 */
						white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
						white-space: -pre-wrap;      /* Opera 4-6 */
						white-space: -o-pre-wrap;    /* Opera 7 */
						word-wrap: break-word;       /* Internet Explorer 5.5+ */
						}
				</style>
			</head>
			<body>
				<div class="page">
					<h2>Отказ в запрашиваемых действиях
						<br/>
					</h2>
					<table border="0" cellpadding="2" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td class="graphLittle">
									<xsl:if test="rrqo:RejectNumber">
								Номер документа: <xsl:apply-templates select="rrqo:RejectNumber"/>
									</xsl:if>
								</td>
								<td class="graphLittle">
								Дата создания докумета:
								<xsl:apply-templates mode="russian_date" select="rrqo:RejectDate"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td class="graphLittle">
								Время создания документа:
								<xsl:apply-templates mode="russian_time" select="rrqo:RejectTime"/>
								</td>
							</tr>
						</tbody>
					</table>
					<hr align="center;" size="2"/>
					<table border="0" cellpadding="2" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td align="left" class="graph" style="width = 180mm;">
									<xsl:if test="rrqo:Customs/cat_ru:OfficeName">
										<span class="graphNo">Наименование таможенного органа: </span>
										<xsl:apply-templates select="rrqo:Customs/cat_ru:OfficeName"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="left" class="graph" style="width = 180mm;">
									<span class="graphNo">Код таможенного органа: </span>
									<xsl:apply-templates select="rrqo:Customs/cat_ru:Code"/>
								</td>
								<br/>
							</tr>
							<xsl:if test="rrqo:RejectNumber">
								<!-- если нет этого номера, то это ответ не назапрос декларанта, тогда выводить номер запроса не надо-->
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<br/>
										<span class="graphNo">Запрос декларанта № </span>
										<xsl:if test="rrqo:ReqNumber">
											<xsl:apply-templates select="rrqo:ReqNumber"/>
										</xsl:if>
										от
										<xsl:apply-templates mode="russian_date" select="rrqo:ReqDate"/>
										<br/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="rrqo:RequestPositionID">
								<tr>
									<td class="graph" style="width:180mm;">
										<span class="graphNo">Идентификатор позиции в исходном запросе </span>
										<xsl:apply-templates select="rrqo:RequestPositionID"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" style="width = 180mm; text-">
									<span class="graphNo">Причины отказа: </span>
									<PRE>
										<xsl:for-each select="rrqo:RejectReason">
											<xsl:apply-templates/>
										</xsl:for-each>
									</PRE>
								</td>
								<br/>
							</tr>
							<tr>
								<td class="graph" style="width = 180mm;">
									<xsl:if test="rrqo:Comments">
										<span class="graphNo">Комментарий: </span>
										<xsl:value-of select="rrqo:Comments"/>
									</xsl:if>
								</td>
								<br/>
							</tr>
							<tr>
								<td align="center" class="graph;" width="180mm;">
									<br/>
									<xsl:value-of select="rrqo:CustomsPerson/cat_ru:PersonName"/>
									<hr color="black" size="1"/>
									<span class="graphNo">Уполномоченное должностное лицо таможенного органа </span>
								</td>
								<td align="center" class="graph;" width="180mm;">
									<br/>
									<xsl:if test="rrqo:CustomsPerson/cat_ru:LNP">
										<xsl:apply-templates select="rrqo:CustomsPerson/cat_ru:LNP"/>
										<xsl:if test="rrqo:CustomsPerson/cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="rrqo:CustomsPerson/cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<hr color="black" size="1"/>
										<span class="graphNo">ЛНП</span>
									</xsl:if>
								</td>
								<br/>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template match="//*[local-name()='RejectReqOperation']//*" priority="-1">
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
