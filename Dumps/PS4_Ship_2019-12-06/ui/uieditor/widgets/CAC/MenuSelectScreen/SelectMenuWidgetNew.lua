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
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background.classAllocation:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	background:subscribeToGlobalModel( controller, "CustomClassMenu", nil, function ( model )
		background:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionInfoWidget = CoD.SelectionInfoWidgetNew.new( menu, controller )
	selectionInfoWidget:setLeftRight( true, true, 384, 0 )
	selectionInfoWidget:setTopBottom( true, false, 124, 720 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	selectionInfoWidget:linkToElementModel( self, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( true, true, 368, -62 )
				self.selectionInfoWidget:setTopBottom( true, false, 124, 720 )
				self.clipFinished( selectionInfoWidget, {} )
			end,
			GridLayout = function ()
				self:setupElementClipCounter( 1 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( true, true, 430, 0 )
					selectionInfoWidget:setTopBottom( true, false, 124, 720 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( true, true, 366, -64 )
				self.selectionInfoWidget:setTopBottom( true, false, 124, 720 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
			end
		},
		GridLayout = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( true, true, 430, 0 )
				self.selectionInfoWidget:setTopBottom( true, false, 124, 720 )
				self.selectionInfoWidget:setAlpha( 1 )
				self.clipFinished( selectionInfoWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( true, true, 368, -62 )
					selectionInfoWidget:setTopBottom( true, false, 124, 720 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( true, true, 430, 0 )
				self.selectionInfoWidget:setTopBottom( true, false, 124, 720 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.selectionInfoWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

