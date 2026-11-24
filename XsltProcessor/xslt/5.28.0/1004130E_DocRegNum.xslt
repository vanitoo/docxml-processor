<?xml version="1.0" encoding="utf-8"?>

<!-- бланк в свободной форме-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:drn="urn:customs.ru:Information:CustomsDocuments:DocRegNum:5.24.0">
	<!-- Шаблон для типа DocRegNumType -->
	<xsl:template match="drn:DocRegNum">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
									}

									.value
									{
									border-bottom: solid 1px black;
									}

									div.title, tr.title td { font-weight:bold;  }
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
								</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>Регистрационный номер документа</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:apply-templates select="drn:DocNumber"/>
					<xsl:apply-templates select="drn:DTNumber"/>
					<xsl:apply-templates select="drn:RegNoticeNumber"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="drn:DocNumber">
		<xsl:if test="cat_ru:PrDocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа drn:DTNumType -->
	<xsl:template match="drn:DTNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
					<xsl:text>/</xsl:text>
					<xsl:choose>
						<xsl:when test="drn:DTKind = 5">
							<xsl:apply-templates select="cat_ru:GTDNumber"/>
							<xsl:if test="drn:AddNumber">
								<xsl:text>/</xsl:text>
								<xsl:apply-templates select="drn:AddNumber"/>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="drn:AddNumber"/>
							<xsl:apply-templates select="cat_ru:GTDNumber"/>
						</xsl:otherwise>
					</xsl:choose>
					
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип декларации:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="drn:DTKind=0">
							<xsl:text>транзитная декларация</xsl:text>
						</xsl:when>
						<xsl:when test="drn:DTKind=1">
							<xsl:text>декларация на товары</xsl:text>
						</xsl:when>
						<xsl:when test="drn:DTKind=2">
							<xsl:text>уведомление о прибытии</xsl:text>
						</xsl:when>
						<xsl:when test="drn:DTKind=3">
							<xsl:text>декларация на ЭГ</xsl:text>
						</xsl:when>
						<xsl:when test="drn:DTKind=4">
							<xsl:text>заявление о необходимости совершения операций в отношении товаров, находящихся под таможенным контролем</xsl:text>
						</xsl:when>
						<xsl:when test="drn:DTKind=5">
							<xsl:text>расчет утилизационного сбора</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="drn:DTKind"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<xsl:if test="drn:KDTNum">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер КДТ по порядку:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="drn:KDTNum"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="drn:ConsignmentNum">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер товарной партии в уведомлении:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="drn:ConsignmentNum"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="drn:MatchSign">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Признак соответствия сведений ПТД:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="drn:MatchSign"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="drn:RegNoticeNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Регистрационный номер:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_gtd"/>
					<xsl:text>/</xsl:text>
					<xsl:choose>
						<xsl:when test="drn:AddNumber and contains('ИМ70 ИМ53 ПТ53 ЭК23', drn:AddNumber)">
							<xsl:apply-templates select="drn:AddNumber"/>
							<xsl:text>/</xsl:text>
							<xsl:apply-templates select="cat_ru:SerialNumber"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="cat_ru:SerialNumber"/>
							<xsl:if test="drn:AddNumber">
								<xsl:text>/</xsl:text>
								<xsl:apply-templates select="drn:AddNumber"/>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	
	<xsl:template match="drn:MatchSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 0 or translate(substring(., 1, 1), 'F', 'f') = 'f'">выявлено несоответствие</xsl:when>
				<xsl:when test=". = 1 or translate(substring(., 1, 1), 'T', 't') = 't'">сведения соответствуют</xsl:when>
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
	<xsl:template match="//*[local-name()='DocRegNum']//*" priority="-1">
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
