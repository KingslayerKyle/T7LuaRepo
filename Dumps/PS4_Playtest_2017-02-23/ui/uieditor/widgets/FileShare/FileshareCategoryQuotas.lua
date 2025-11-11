require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )
require( "ui.uieditor.widgets.FileShare.FileshareGroupQuotaLine" )

CoD.FileshareCategoryQuotas = InheritFrom( LUI.UIElement )
CoD.FileshareCategoryQuotas.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FileshareCategoryQuotas )
	self.id = "FileshareCategoryQuotas"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 555 )
	self:setTopBottom( 0, 0, 0, 285 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 555 )
	BG:setTopBottom( 0, 0, 0, 285 )
	BG:setRGB( 0.17, 0.17, 0.17 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	List0:makeFocusable()
	List0:setLeftRight( 1, 1, -548, -8 )
	List0:setTopBottom( 0, 0, 11, 273 )
	List0:setWidgetType( CoD.FileshareGroupQuotaLine )
	List0:setVerticalCount( 6 )
	List0:setDataSource( "FileshareQuotaList" )
	List0:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		local element = List0
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( List0 )
	self.List0 = List0
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( 0, 0, 0, 555 )
	EmblemEditorFrame0:setTopBottom( 0, 0, 0, 285 )
	self:addElement( EmblemEditorFrame0 )
	self.EmblemEditorFrame0 = EmblemEditorFrame0
	
	List0.id = "List0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.List0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.List0:close()
		self.EmblemEditorFrame0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

