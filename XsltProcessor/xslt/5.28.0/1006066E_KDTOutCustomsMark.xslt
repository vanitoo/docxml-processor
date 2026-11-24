<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:kocm="urn:customs.ru:Information:CustomsDocuments:KDTOutCustomsMark:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа KDTOutCustomsMarkType -->
	<xsl:template match="kocm:KDTOutCustomsMark">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 277mm;
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
										<b>Служебные отметки КДТ</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					Номер ДТ: <xsl:apply-templates select="kocm:GTDID"/>
					<br/>
					Порядковый номер КДТ: <xsl:apply-templates select="kocm:KTDNumber"/>
					<br/>
					Уникальный идентификатор КДТ к которой относятся служебные отметки: <xsl:apply-templates select="kocm:GTDDocumentID"/>
					<br/>
					<br/>
					<xsl:if test="kocm:KDTOutCommonMark">
						<div class="title marg-top">Общие отметки КДТ</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Обозначение графы</td>
									<td class="graphMain bordered">Номер этапа</td>
									<td class="graphMain bordered">Тип примечания</td>
									<td class="graphMain bordered">Служебная запись</td>
									<td class="graphMain bordered">Информация о документе</td>
									<td class="graphMain bordered">Дата проставления отметки</td>
									<td class="graphMain bordered">Время</td>
									<td class="graphMain bordered">ФИО инспектора</td>
									<td class="graphMain bordered">Номер ЛНП инспектора</td>
								</tr>
								<xsl:for-each select="kocm:KDTOutCommonMark">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="kocm:KDTOutGoodsResolution">
						<div class="title marg-top">Служебные отметки КДТ по товарам</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер товара по КДТ</td>
									<td class="graphMain bordered">Обозначение графы</td>
									<td class="graphMain bordered">Номер этапа</td>
									<td class="graphMain bordered">Тип примечания</td>
									<td class="graphMain bordered">Служебная запись</td>
									<td class="graphMain bordered">Общая сумма, подлежащая взысканию (возврату)</td>
									<td class="graphMain bordered">Общая сумма доначисленных условно таможенных платежей, не подлежащая взысканию</td>
									<td class="graphMain bordered">Информация о документе</td>
									<td class="graphMain bordered">Дата проставления отметки</td>
									<td class="graphMain bordered">Время</td>
									<td class="graphMain bordered">ФИО инспектора</td>
									<td class="graphMain bordered">ЛНП инспектора</td>
								</tr>
								<xsl:for-each select="kocm:KDTOutGoodsResolution">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="kocm:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарий:
									<xsl:for-each select="kocm:Comments">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="kocm:FillPerson">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Должностное лицо, заполнившее КДТ:
									<xsl:for-each select="kocm:FillPerson/*">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="kocm:GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа kocm:KDTOutCommonMarkType -->
	<xsl:template match="kocm:KDTOutCommonMark">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="kocm:GRNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="kocm:StageMarkIdentifier='отметки'">
						<xsl:text>1 (номер этапа)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="kocm:StageMarkIdentifier"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="kocm:NoteMarkIdentifier='отметки'">
						<xsl:text>2 (тип примечания)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="kocm:NoteMarkIdentifier"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:MarkDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:DocumentInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="russian_date" select="kocm:DateInf"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="russian_time" select="kocm:TimeInf"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:PersonName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:LNP"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа kocm:KDTOutGoodsResolutionType -->
	<xsl:template match="kocm:KDTOutGoodsResolution">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:GRNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="kocm:StageMarkIdentifier='отметки'">
						<xsl:text>1 (номер этапа)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="kocm:StageMarkIdentifier"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="kocm:NoteMarkIdentifier='отметки'">
						<xsl:text>2 (тип примечания)</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="kocm:NoteMarkIdentifier"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:MarkDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:K470Amount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:K470UAmount"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:DocumentInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="russian_date" select="kocm:DateInf"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="russian_date_time" select="kocm:TimeInf"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:PersonName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="kocm:LNP"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="kocm:DocumentInfo">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
	<xsl:template match="//*[local-name()='KDTOutCustomsMark']//*" priority="-1">
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
