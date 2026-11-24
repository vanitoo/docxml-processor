<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.24.0" xmlns:ata_con="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CloseOperationNotif:5.24.0">
	<!-- Шаблон для типа ATA_CloseOperationNotifType -->
	<xsl:template match="ata_con:ATA_CloseOperationNotif">
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
										<b>Сведения о снятой с контроля операции</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
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
					<div class="title marg-top">Сведения об операции по карнету АТА</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" rowspan="2">Номер карнета АТА</td>
								<td class="graphMain bordered" rowspan="2">Регистрационный номер снятой с контроля операции</td>
								<td class="graphMain bordered" rowspan="2">Код таможенного органа, cнявший с контроля операцию</td>
								<td class="graphMain bordered" rowspan="2">Дата и время подписания</td>
								<td class="graphMain bordered" rowspan="2">Тип операции с карнетом АТА</td>
								<td class="graphMain bordered" rowspan="2">Признак снятия с контроля всех товаров в ваучере</td>
								<td class="graphMain bordered" colspan="2">Товар снятый с контрля операции (заполняется есть UnregisteredAll = false)</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered">Идентификатор объекта контроля</td>
								<td class="graphMain bordered">Статус объекта контроля</td>
							</tr>
							<xsl:for-each select="ata_con:OperationInfo">
								<xsl:variable name="countGoods" select="count(ata_con:GoodInfo)"/>
								<tr valign="top">
									<td class="bordered" rowspan="{$countGoods}">
										<xsl:apply-templates select="ata_con:CarnetNumber"/>
									</td>
									<td class="bordered" rowspan="{$countGoods}">
										<xsl:apply-templates mode="decl" select="ata_con:RegistrationNumber"/>
									</td>
									<td class="bordered " rowspan="{$countGoods}">
										<xsl:apply-templates select="ata_con:CustomsCode"/>
									</td>
									<td class="bordered" rowspan="{$countGoods}">
										<xsl:apply-templates mode="russian_date_time" select="ata_con:IssueDate"/>
									</td>
									<td class="bordered" rowspan="{$countGoods}">
										<xsl:apply-templates select="ata_con:Type"/>
									</td>
									<td class="bordered" rowspan="{$countGoods}">
										<xsl:choose>
											<xsl:when test="ata_con:UnregisteredAll='true' or ata_con:UnregisteredAll='1'">
												<xsl:text>ДА</xsl:text>
											</xsl:when>
											<xsl:when test="ata_con:UnregisteredAll='false' or ata_con:UnregisteredAll='0'">
												<xsl:text>НЕТ</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="ata_con:UnregisteredAll"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ata_con:GoodInfo[1]/ata_con:ObjID"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ata_con:GoodInfo[1]/ata_con:ObjStageCode"/>
									</td>
								</tr>
								<xsl:for-each select="ata_con:GoodInfo[position() &gt; 1]">
									<tr valign="top">
										<td class="bordered">
											<xsl:apply-templates select="ata_con:ObjID"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="ata_con:ObjStageCode"/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_con:GoodInfoType -->
	<xsl:template match="ata_con:GoodInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ata_con:ObjID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ata_con:ObjStageCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ata_con:OperationsInfoType -->
	<xsl:template match="ata_con:OperationInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ata_con:CarnetNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates mode="decl" select="ata_con:RegistrationNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ata_con:CustomsCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates mode="russian_date" select="ata_con:IssueDate"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ata_con:Type"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ata_con:UnregisteredAll='true' or ata_con:UnregisteredAll='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="ata_con:UnregisteredAll='false' or ata_con:UnregisteredAll='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ata_con:UnregisteredAll"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ata_con:GoodInfo">
						<xsl:apply-templates select="ata_con:GoodInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="*" mode="decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
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
	<xsl:template match="//*[local-name()='ATA_CloseOperationNotif']//*" priority="-1">
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
				<xsl:value-of select="substring($dateIn,12,8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
