<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:stznvl="urn:customs.ru:Information:ExchangeDocuments:STZ_NotifViolation:5.25.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа STZ_NotifViolationType -->
	<xsl:template match="stznvl:STZ_NotifViolation">
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
                  
                  td.graphUnderline {
                        border-bottom: 1px solid black;
                        text-align: center;
                       font-weight: bold; 
                    }
                  td.graph {
                        font-size: 7pt;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
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
											<xsl:apply-templates select="stznvl:DocKind" mode="title"/>
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
								<td align="center" colspan="3">
									<xsl:apply-templates select="stznvl:DocDate" mode="russian_date"/>
								</td>
							</tr>
							<tr>
								<td align="left" style="width:65mm">
									<xsl:apply-templates select="stznvl:Customs"/>
								</td>
								<td align="left" style="width:50mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="right" style="width:65mm">
									
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Настоящим уведомляем, что уполномоченным таможенным органом принято решение о продлении срока рассмотрения Заявления о завершении действия СТЗ</xsl:text>
									<xsl:text> № </xsl:text>
									<xsl:apply-templates select="stznvl:AppRegNum"/>
									<xsl:text> до </xsl:text>
									<xsl:apply-templates select="stznvl:RenewalPeriod" mode="russian_date"/>
									<xsl:text> по следующим причинам: </xsl:text>
									<xsl:apply-templates select="stznvl:ProlongReason"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="stznvl:CustomsPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="stznvl:DocKind" mode="title">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Уведомление<br/>о продлении срока рассмотрения Заявления о завершении действия таможенной процедуры СТЗ в отношении товаров, помещенных под эту процедуру, и признания таких товаров товарами ЕАЭС</xsl:when>
				<xsl:when test=". = 2">Уведомление<br/>о продлении срока рассмотрения Заявления о завершении таможенной процедуры СТЗ в отношении товаров, которые были израсходованы</xsl:when>
				<xsl:when test=". = 3">Уведомление<br/>о продлении срока рассмотрения Заявления на выоз товаров поиещенных под таможенную процедуру СТЗ и товаров, изготовленных из товаров, помещеных под процедуру СТЗ в соответствии с пп.1,2, 5 пункта 4 статьи 205 ТК ЕАЭС</xsl:when>
				<xsl:when test=". = 4">Уведомление<br/>о продлении срока рассмотрения Заявления о передаче товаров , помещенных под таможенную процедуру СТЗ, и (или) товаров, изготовленных (полученных) из товаров, помещенных под таможенную процедуру СТЗ, в отношении которых переданы права владения, пользования и (или) распоряжения, без завершения действия таможенной процедуры СТЗ (по ПК 200н)</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	<!-- Шаблон для типа stznvl:AppRegNumType -->
	<xsl:template match="stznvl:AppRegNum">

		<xsl:apply-templates select="stznvl:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stznvl:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="stznvl:Number"/>
		<xsl:apply-templates select="stznvl:Abbreviation"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="stznvl:Customs">
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
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="stznvl:CustomsPerson">
		<table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
			<tbody>
				<tr>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				</tr>
				<tr>
					<td align="center" class="graphNormal" style="width:80mm">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
					<td style="width:60mm">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<td align="center" class="graphNormal" style="width:50mm">
						<xsl:if test="cat_ru:LNP">
							<xsl:value-of select="cat_ru:LNP"/>
							<xsl:if test="cat_ru:CustomsCode">
								<xsl:text> (код ТО: </xsl:text>
								<xsl:value-of select="cat_ru:CustomsCode"/>
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
	<xsl:template match="//*[local-name()='STZ_NotifViolation']//*" priority="-1">
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
