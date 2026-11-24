<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mpke="urn:customs.ru:Information:CustomsDocuments:MPOMarkExport:5.24.0">
	<!-- Шаблон для типа MPOMarkExportType -->
	<xsl:template match="mpke:MPOMarkExport">
		<xsl:param name="w" select="277"/>
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
										<b>Отметки по реестру МПО экспорт</b>
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
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="mpke:Reestr_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpke:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpke:DocType">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Тип документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpke:DocType" mode="translate_number"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpke:MPOReg">
						<div class="title marg-top">Регистрационный номер реестра </div>
						<div>
							<xsl:apply-templates select="mpke:MPOReg">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Решения по МПО из реестра</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Уникальный номер записи в реестре МПО</td>
								<td class="graphMain bordered">Номер по порядку в реестре</td>
								<td class="graphMain bordered">Сведения о регистрационном номере МПО</td>
								<td class="graphMain bordered">Решения по МПО </td>
							</tr>
							<xsl:for-each select="mpke:MPORegInfoList">
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
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="mpke:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа mpke:MPORegType -->
	<xsl:template match="mpke:MPOReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="." mode="reg_num"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpke:MPOMarkType -->
	<xsl:template match="mpke:MPORegInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время решения </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpke:DecisionDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mpke:DecisionCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Решение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpke:DecisionCode='10'">
									<xsl:text>регистрация МПО</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='13'">
									<xsl:text>отказ в регистрации</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='20'">
									<xsl:text>выпуск разрешен</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='23'">
									<xsl:text>отказ в выпуске</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='24'">
									<xsl:text>Отказано в автоматическом выпуске</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='26'">
									<xsl:text>выпуск товаров приостановлен</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='27'">
									<xsl:text>cрок выпуска товаров продлен</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='29'">
									<xsl:text>отказ в выпуске по решению должностного лица</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='30'">
									<xsl:text>МПО отозвано</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='50'">
									<xsl:text>убытие разрешено</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='51'">
									<xsl:text>убытие запрещено</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='52'">
									<xsl:text>отказано в автоматическом разрешении на убытие</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:DecisionCode='53'">
									<xsl:text>отказано в убытие</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="mpke:DecisionCode"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:DecisionDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание принятого решения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:DecisionDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:ReasonCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код причины принятого решения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:ReasonCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:ReasonDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание причины принятого решения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:ReasonDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:RecommendationCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код рекомендации </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:RecommendationCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:RecomDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание рекомендации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:RecomDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:Comments">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Комментарии</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="mpke:Comments">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:InspectionSign">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак необходимости предоставления с уведомлением о прибытии результатов таможенного осмотра</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpke:InspectionSign='true' or mpke:InspectionSign='1'">
									<xsl:text>ДА</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:InspectionSign='false' or mpke:InspectionSign='0'">
									<xsl:text>НЕТ</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="mpke:InspectionSign"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:RecallSign">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак отказа в отзыве МПО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpke:RecallSign='true' or mpke:RecallSign='1'">
									<xsl:text>ДА</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:RecallSign='false' or mpke:RecallSign='0'">
									<xsl:text>НЕТ</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="mpke:RecallSign"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:MPOReceive">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">МПО принято в ИПА</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpke:MPOReceive='true' or mpke:MPOReceive='1'">
									<xsl:text>ДА</xsl:text>
								</xsl:when>
								<xsl:when test="mpke:MPOReceive='false' or mpke:MPOReceive='0'">
									<xsl:text>НЕТ</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="mpke:MPOReceive"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpke:CustomsPerson">
				<div class="title marg-top">Должностное лицо таможенного органа</div>
				<div>
					<xsl:apply-templates select="mpke:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="mpke:ProlongDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок продления/приостановки выпуска товаров</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpke:ProlongDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа mpke:MPORegInfoLlistType -->
	<xsl:template match="mpke:MPORegInfoList">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpke:MPO_ID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpke:RecNum"/>
				</td>
				<td class="graphMain bordered">
						<xsl:apply-templates select="mpke:MPO_Registration" mode="reg_num"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="mpke:MPORegInfo">
						<xsl:apply-templates select="mpke:MPORegInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpke:MPO_Registration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpco:CustomsCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpco:RegistrationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный номер МПО</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpco:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[1]"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[2]" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[3]"/>
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
	<xsl:template name="russian_date">
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
	<xsl:template match="//*[local-name()='MPOMarkExport']//*" priority="-1">
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
