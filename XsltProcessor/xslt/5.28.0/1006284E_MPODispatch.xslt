<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:mpd="urn:customs.ru:Information:RegistrationDocuments:MPODispatch:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MPODispatchType -->
	<xsl:template match="mpd:MPODispatch">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
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
										<b>Депеша с МПО</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Направление перемещения: ИМ - ввоз МПО, ЭК - вывоз МПО</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="mpd:CustomsProcedure='ИМ'">
										<xsl:text>ввоз МПО</xsl:text>
									</xsl:when>
									<xsl:when test="mpd:CustomsProcedure='ЭК'">
										<xsl:text>вывоз МПО</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="mpd:CustomsProcedure"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="mpd:DispatchNum">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер депеши</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpd:DispatchNum"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата депеши</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="mpd:ReleaseDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Перечень МПО</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Порядковый номер в депеше</td>
								<td class="graphMain bordered">Номер МПО по ВПС</td>
								<td class="graphMain bordered">Регистрационный номер ЭД МПО </td>
								<td class="graphMain bordered">Решение по МПО</td>
							</tr>
							<xsl:for-each select="mpd:MPOList">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpd:MPOListType -->
	<xsl:template match="mpd:MPOList">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:value-of select="mpd:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="mpd:MPORegNum"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="mpd:MPOReg">
						<xsl:apply-templates select="mpd:MPOReg"/>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="mpd:Decision"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpd:MPORegType -->
	<xsl:template match="mpd:MPOReg">
		<xsl:value-of select="mpd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="reestr_date">
			<xsl:with-param name="dateIn" select="mpd:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="mpd:MPO_Number"/>
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
	<xsl:template name="reestr_date">
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
</xsl:stylesheet>
