require( "ui.uieditor.widgets.FileShare.FileshareGroupQuotaLine" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorFrame" )

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
	self:setLeftRight( true, false, 0, 370 )
	self:setTopBottom( true, false, 0, 190 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 370 )
	BG:setTopBottom( true, false, 0, 190 )
	BG:setRGB( 0.17, 0.17, 0.17 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local List0 = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	List0:makeFocusable()
	List0:setLeftRight( false, true, -365, -5 )
	List0:setTopBottom( true, false, 6, 184 )
	List0:setWidgetType( CoD.FileshareGroupQuotaLine )
	List0:setVerticalCount( 6 )
	List0:setDataSource( "FileshareQuotaList" )
	List0:subscribeToGlobalModel( controller, "FileshareRoot", "dirty", function ( model )
		UpdateDataSource( self, List0, controller )
	end )
	List0:subscribeToGlobalModel( controller, "MediaManager", "dirty", function ( model )
		UpdateDataSource( self, List0, controller )
	end )
	self:addElement( List0 )
	self.List0 = List0
	
	local EmblemEditorFrame0 = CoD.EmblemEditorFrame.new( menu, controller )
	EmblemEditorFrame0:setLeftRight( true, false, 0, 370 )
	EmblemEditorFrame0:setTopBottom( true, false, 0, 190 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List0:close()
		element.EmblemEditorFrame0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

