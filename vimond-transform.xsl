<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:is="urn:jboss:domain:infinispan:4.0"
                xmlns:jboss="urn:jboss:domain:4.0">

    <xsl:output method="xml" indent="yes"/>

    <!-- set replication factor on keycloak caches -->
    <xsl:template match="is:subsystem/is:cache-container[@name='keycloak']/is:distributed-cache/@owners">
        <xsl:attribute name="owners">
            <xsl:text>${env.CACHE_REPLICATION_FACTOR:2}</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <!-- set binding ip for public port -->
    <xsl:template match="jboss:interfaces/jboss:interface[@name='public']/jboss:inet-address/@value">
        <xsl:attribute name="value">
            <xsl:text>0.0.0.0</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <!-- set binding ip for private port -->
    <xsl:template match="jboss:interfaces/jboss:interface[@name='private']/jboss:inet-address/@value">
        <xsl:attribute name="value">
            <xsl:text>0.0.0.0</xsl:text>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
