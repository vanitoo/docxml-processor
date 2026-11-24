<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:nnt="urn:customs.ru:Information:CustomsDocuments:NotifNotDecl:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Версия 4.7.0.0 от 25.02.2009.   -->
	<xsl:output encoding="UTF-8" indent="no" media-type="text/html" omit-xml-declaration="no" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="russian_date2">
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
	<xsl:template match="nnt:NotifNotDecl">
		<html>
			<head/>
			<body>
				<table border="1">
					<tbody>
						<tr>
							<td align="center" width="126">
								<xsl:apply-templates mode="russian_date" select="nnt:SendDate"/>
								<xsl:text> </xsl:text>
								<xsl:apply-templates mode="russian_time" select="nnt:SendTime"/>
							</td>
						</tr>
					</tbody>
				</table>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td align="center">
								<span style="font-size:large; font-weight:bold; ">Уведомление</span>
								<br/>
								<span style="font-size:medium; font-weight:bold; ">
									<xsl:apply-templates mode="docKind" select="nnt:DocKind"/>
								</span>
							</td>
						</tr>
						<tr>
							<td align="center"/>
						</tr>
					</tbody>
				</table>
				<br/>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td width="131">
								<table border="1">
									<tbody>
										<tr>
											<td align="center" width="110">
												<xsl:apply-templates select="nnt:Customs/cat_ru:Code"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table border="1">
									<tbody>
										<tr>
											<td align="center" height="22" width="371">
												<xsl:apply-templates select="nnt:Customs/cat_ru:OfficeName"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td align="left">Уведомляем Вас 
								<xsl:apply-templates mode="docKind" select="nnt:DocKind"/>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
                Регистрационный номер
                <xsl:choose>
					<xsl:when test="nnt:DocKind = 0"> ДТ</xsl:when>
					<xsl:when test="nnt:DocKind = 1"> листа отказа</xsl:when>
				</xsl:choose>
				<xsl:text>: </xsl:text>
				<xsl:if test="nnt:GTDID">
					<xsl:apply-templates select="nnt:GTDID/cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates mode="russian_date_gtd" select="nnt:GTDID/cat_ru:RegistrationDate"/>
					<xsl:text>/</xsl:text>
					<xsl:apply-templates select="nnt:GTDID/cat_ru:GTDNumber"/>
				</xsl:if>
				<br/>
				<xsl:if test="nnt:RegistrationNumberId">
					<xsl:text>Регистрационный номер в реестре таможенных представителей: </xsl:text>
					<xsl:apply-templates select="nnt:RegistrationNumberId"/>
				</xsl:if>
				<br/>
				<br/>
				<xsl:if test="nnt:Comments">Комментарии:
					<xsl:for-each select="nnt:Comments">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</xsl:if>
				<br/>
				<br/>
				<xsl:if test="nnt:CustomsPerson">
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td align="center" width="422">
									<xsl:if test="nnt:CustomsPerson/cat_ru:PersonName">
										<xsl:apply-templates select="nnt:CustomsPerson/cat_ru:PersonName"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td width="123"/>
								<td align="center">
									<xsl:if test="nnt:CustomsPerson/cat_ru:LNP">
										<xsl:apply-templates select="nnt:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" width="422">
									<hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
								<td width="123"/>
								<td align="center">
									<hr color="black" size="1"/>ЛНП</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
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
				<xsl:value-of select="substring($dateIn, 1, 5)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='NotifNotDecl']//*" priority="-1">
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
	<xsl:template name="docKind">
		<xsl:param name="kindIn"/>
		<xsl:choose>
			<xsl:when test="$kindIn = 0">о том, что таможенная декларация считается неподанной</xsl:when>
			<xsl:when test="$kindIn = 1">об отказе в регистрации</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="docKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="docKind">
				<xsl:with-param name="kindIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
</xsl:stylesheet>
