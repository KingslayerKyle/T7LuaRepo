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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACBackgroundNew.new( menu, controller )
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background.classAllocation:setAlpha( HideIfInPermanentUnlockMenu( 1 ) )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	background:subscribeToGlobalModel( controller, "CustomClassMenu", nil, function ( model )
		background:setModel( model, controller )
	end )
	self:addElement( background )
	self.background = background
	
	local selectionInfoWidget = CoD.SelectionInfoWidgetNew.new( menu, controller )
	selectionInfoWidget:setLeftRight( 0, 1, 576, 0 )
	selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName:setAlpha( 0 )
	selectionInfoWidget.itemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	selectionInfoWidget:linkToElementModel( self, nil, false, function ( model )
		selectionInfoWidget:setModel( model, controller )
	end )
	selectionInfoWidget:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionInfoWidget.itemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( selectionInfoWidget )
	self.selectionInfoWidget = selectionInfoWidget
	
	self.resetProperties = function ()
		selectionInfoWidget:completeAnimation()
		selectionInfoWidget:setLeftRight( 0, 1, 576, 0 )
		selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 0, 1, 552, -92 )
				self.selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
				self.clipFinished( selectionInfoWidget, {} )
			end,
			GridLayout = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( 0, 1, 644, 0 )
					selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 0, 1, 548, -96 )
				self.selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
			end
		},
		GridLayout = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 0, 1, 644, 0 )
				self.selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
				self.clipFinished( selectionInfoWidget, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectionInfoWidgetFrame2 = function ( selectionInfoWidget, event )
					if not event.interrupted then
						selectionInfoWidget:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectionInfoWidget:setLeftRight( 0, 1, 552, -92 )
					selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
					if event.interrupted then
						self.clipFinished( selectionInfoWidget, event )
					else
						selectionInfoWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionInfoWidget:completeAnimation()
				self.selectionInfoWidget:setLeftRight( 0, 1, 644, 0 )
				self.selectionInfoWidget:setTopBottom( 0, 0, 186, 1080 )
				selectionInfoWidgetFrame2( selectionInfoWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.selectionInfoWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

