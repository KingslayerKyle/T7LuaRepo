-- c47c18433d74a24f4680441b6a7cdc35
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutListItem" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItemHintText" )

CoD.CodCasterLoadoutItem = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterLoadoutItem )
	self.id = "CodCasterLoadoutItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterLoadoutSubGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 0, 0, nil, nil, false, false, 0, 0, false, false )
	CodCasterLoadoutSubGrid:setLeftRight( true, false, 0, 360 )
	CodCasterLoadoutSubGrid:setTopBottom( true, false, 0, 72 )
	CodCasterLoadoutSubGrid:setWidgetType( CoD.CodCasterLoadoutListItem )
	CodCasterLoadoutSubGrid:setHorizontalCount( 6 )
	CodCasterLoadoutSubGrid:setSpacing( 0 )
	LUI.OverrideFunction_CallOriginalFirst( CodCasterLoadoutSubGrid, "setWidth", function ( element, controller )
		if IsWidthZero( controller ) and IsElementInState( element, "Shown" ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( CodCasterLoadoutSubGrid )
	self.CodCasterLoadoutSubGrid = CodCasterLoadoutSubGrid
	
	local FocusTop = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusTop:setLeftRight( true, true, 0, 0 )
	FocusTop:setTopBottom( true, false, 2, 10 )
	self:addElement( FocusTop )
	self.FocusTop = FocusTop
	
	local FocusBottom = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBottom:setLeftRight( true, true, 0, 0 )
	FocusBottom:setTopBottom( true, false, 66, 74 )
	self:addElement( FocusBottom )
	self.FocusBottom = FocusBottom
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( false, true, -1, 3 )
	spacer:setTopBottom( true, true, 0, 0 )
	spacer:setRGB( 0, 0, 0 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local CodCasterLoadoutItemHintText = CoD.CodCasterLoadoutItemHintText.new( menu, controller )
	CodCasterLoadoutItemHintText:setLeftRight( false, false, -230.5, 230.5 )
	CodCasterLoadoutItemHintText:setTopBottom( false, true, -99, -79 )
	self:addElement( CodCasterLoadoutItemHintText )
	self.CodCasterLoadoutItemHintText = CodCasterLoadoutItemHintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CodCasterLoadoutSubGrid:completeAnimation()
				self.CodCasterLoadoutSubGrid:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutSubGrid, {} )
				FocusTop:completeAnimation()
				self.FocusTop:setAlpha( 0 )
				self.clipFinished( FocusTop, {} )
				FocusBottom:completeAnimation()
				self.FocusBottom:setAlpha( 0 )
				self.clipFinished( FocusBottom, {} )
				spacer:completeAnimation()
				self.spacer:setAlpha( 0 )
				self.clipFinished( spacer, {} )
				CodCasterLoadoutItemHintText:completeAnimation()
				self.CodCasterLoadoutItemHintText:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutItemHintText, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CodCasterLoadoutSubGrid:completeAnimation()
				self.CodCasterLoadoutSubGrid:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutSubGrid, {} )
				FocusTop:completeAnimation()
				self.FocusTop:setAlpha( 0 )
				self.clipFinished( FocusTop, {} )
				FocusBottom:completeAnimation()
				self.FocusBottom:setAlpha( 0 )
				self.clipFinished( FocusBottom, {} )
				spacer:completeAnimation()
				self.spacer:setAlpha( 1 )
				self.clipFinished( spacer, {} )
				CodCasterLoadoutItemHintText:completeAnimation()
				self.CodCasterLoadoutItemHintText:setAlpha( 0 )
				self.clipFinished( CodCasterLoadoutItemHintText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 3 )
				FocusTop:completeAnimation()
				self.FocusTop:setAlpha( 1 )
				self.clipFinished( FocusTop, {} )
				FocusBottom:completeAnimation()
				self.FocusBottom:setAlpha( 1 )
				self.clipFinished( FocusBottom, {} )
				CodCasterLoadoutItemHintText:completeAnimation()
				self.CodCasterLoadoutItemHintText:setAlpha( 1 )
				self.clipFinished( CodCasterLoadoutItemHintText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if PropertyIsTrue( self, "m_active" ) and IsElementInState( element, "Shown" ) then
			PlayClip( self, "Active", controller )
			RestoreWidgetWidth( self )
		elseif IsElementInState( element, "Shown" ) then
			RestoreWidgetWidth( self )
		else
			SetWidth( self, "0" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterLoadoutSubGrid:close()
		element.FocusTop:close()
		element.FocusBottom:close()
		element.CodCasterLoadoutItemHintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

