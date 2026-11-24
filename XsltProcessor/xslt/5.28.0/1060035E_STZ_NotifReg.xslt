<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:stznr="urn:customs.ru:Information:ExchangeDocuments:STZ_NotifReg:5.27.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа STZ_NotifRegType -->
	<xsl:template match="stznr:STZ_NotifReg">
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:apply-templates select="stznr:DocKind" mode="title"/>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table style="table-layout: fixed; width: 125mm;">
						<tbody>
							<tr align="center" valign="top">
								<td class="graphMain bordered" style="width: 20mm;">
									<xsl:apply-templates select="stznr:Customs/cat_ru:Code"/>
								</td>
								<td style="width: 5mm;"></td>
								<td class="graphMain bordered" style="width: 100mm;">
									<xsl:apply-templates select="stznr:Customs/cat_ru:OfficeName"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<span style="font-weight: bold">Регистрационный номер документа: </span>
					<span>
						<xsl:apply-templates select="stznr:RegistrationNumber"/>
					</span>
					<br/>
					<br/>
					<br/>
					<xsl:apply-templates select="stznr:CustomsPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="stznr:DocKind" mode="title">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Заявление о завершении действия таможенной процедуры СТЗ в отношении товаров, помещенных под эту процедуру, и признания таких товаров товарами ЕАЭС</xsl:when>
				<xsl:when test=". = 2">Заявление о завершении таможенной процедуры СТЗ в отношении товаров, которые были израсходованы</xsl:when>
				<xsl:when test=". = 3">Заявление на вывоз товаров, помещенных под таможенную процедуру СТЗ или изготовленных из товаров, помещенных под процедуру СТЗ, для собственных технологических нужд</xsl:when>
				<xsl:when test=". = 4">Заявление на вывоз декларируемых товаров на остальную часть территории СЭЗ (Крым и/или Севастополь) для собственных технологических нужд</xsl:when>
				<xsl:when test=". = 5">Заявление на вывоз товаров поиещенных под таможенную процедуру СТЗ и товаров, изготовленных из товаров, помещеных под процедуру СТЗ в соответствии с пп.1,2, 5 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 6">Заявление о передаче товаров, помещенных под таможенную процедуру СТЗ, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ, в отношении которых переданы права владения, пользования и (или) распоряжения, без завершения действия таможенной процедуры СТЗ (по ПК 200н)</xsl:when>
				<xsl:when test=". = 7">Заявление о завершении СТЗ по товарам, использованным для создания недвижимости</xsl:when>
				<xsl:when test=". = 8">Заявление о завершении СТЗ по потребленным товарам, в рамках операций по их переработке</xsl:when>
				<xsl:when test=". = 9">Обязательство о соблюдении условий использования товаров, помещенных под таможенную процедуру СТЗ</xsl:when>
				<xsl:when test=". = 10">Заявление на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 11">Заявление на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<!--xsl:when test=". = 12">Разрешение таможенного органа  на совершение операций, предусмотренных подпунктами 1 и 2 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 13">Разрешение таможенного органа на совершение операций, предусмотренных подпунктом 5 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 14">Уведомление об отказе в выдаче разрешения на совершение операций, предусмотренных подпунктами 1, 2 и 5 пункта 4 статьи 205 ТК ЕАЭС</xsl:when-->
			</xsl:choose>
		</element>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="stznr:CustomsPerson">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td width="70%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
					<td width="5%"></td>
					<td width="25%">
						<xsl:apply-templates select="cat_ru:LNP"/>
						<xsl:if test="cat_ru:CustomsCode">
							<xsl:text> (</xsl:text>
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr align="center" valign="top">
					<td style="border-top: 1px solid black; font-size:8pt;">Должностное лицо таможенного органа</td>
					<td/>
					<td style="border-top: 1px solid black; font-size:8pt;">ЛНП</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа stznr:RegistrationNumberType -->
	<xsl:template match="stznr:RegistrationNumber">
		<xsl:apply-templates select="stznr:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stznr:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stznr:Number"/>
		<xsl:if test="stznr:DocKind">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="stznr:DocKind"/>
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
	<xsl:template match="//*[local-name()='STZ_NotifReg']//*" priority="-1">
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
