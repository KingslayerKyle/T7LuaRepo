require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.SelectionInfoWidgetNew" )

CoD.SelectMenuWidgetNew = InheritFrom( LUI.UIElement )
CoD.SelectMenuWidgetNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectMenuWidgetNew )
	self.id = "SelectMenuWidgetNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACBackgroundNew.new( menu, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 1, 1, 1 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_NEW" ) )
	background:subscribeToGlobalModel( controller, "CustomClassMenu", nil, function ( model )
		background:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionInfoWidget = CoD.SelectionInfoWidgetNew.new( menu, controller )
	selectionInfoWidget:setLeftRight( false, true, -912, -62 )
	selectionInfoWidget:setTopBottom( false, true, -596, 0 )
	selectionInfoWidget:setRGB( 1, 1, 1 )
	selectionInfoWidget:linkToElementModel( self, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.WeaponNameWidget0.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	selectionInfoWidget:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse() and IsCACItemLocked( menu, element, controller )
			end
		}
	} )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	local listBg = LUI.UIImage.new()
	listBg:setLeftRight( true, false, 104.5, 368 )
	listBg:setTopBottom( true, false, 150, 598 )
	listBg:setRGB( 1, 1, 1 )
	listBg:setAlpha( 0 )
	listBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( listBg )
	self.listBg = listBg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -909, -59 )
				self.selectionInfoWidget:setTopBottom( false, true, -597, 0 )
				self.clipFinished( selectionInfoWidget, {} )
			end
		},
		Update = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Update2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Update3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Intro = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		GridLayout = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( false, true, -850, 0 )
				self.selectionInfoWidget:setTopBottom( false, true, -597, -1 )
				self.clipFinished( selectionInfoWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "background", controller, "Update" )
		elseif IsElementInState( element, "Update2" ) then
			SetElementStateByElementName( self, "background", controller, "Update2" )
		elseif IsElementInState( element, "Update3" ) then
			SetElementStateByElementName( self, "background", controller, "Update3" )
		elseif IsElementInState( element, "Intro" ) then
			SetElementStateByElementName( self, "background", controller, "Intro" )
		end
	end )
	self.close = function ( self )
		self.background:close()
		self.selectionInfoWidget:close()
		CoD.SelectMenuWidgetNew.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

