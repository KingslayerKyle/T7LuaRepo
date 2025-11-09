require( "ui.uieditor.widgets.Prestige.Prestige_ParagonMilestoneIcon" )

DataSources.PrestigeMasterTiers = DataSourceHelpers.ListSetup( "PrestigeMasterTiers", function ( f1_arg0 )
	local f1_local0 = {}
	for f1_local1 = 1, CoD.PrestigeUtility.PRESTIGE_MASTER_MAX_TIERS, 1 do
		table.insert( f1_local0, {
			models = {
				id = f1_local1
			}
		} )
	end
	return f1_local0
end )
CoD.Prestige_MasterTierWidget = InheritFrom( LUI.UIElement )
CoD.Prestige_MasterTierWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_MasterTierWidget )
	self.id = "Prestige_MasterTierWidget"
	self.soundSet = "AAR"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( true, true, 0, 0 )
	Bar:setTopBottom( true, false, 0, 4 )
	Bar:setRGB( 0.92, 0.64, 0.15 )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Bar:setShaderVector( 0, 0, 0.4, 0, 0.4 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local ParagonStars = LUI.GridLayout.new( menu, controller, false, 0, 0, 3, 0, nil, nil, false, false, 0, 0, false, false )
	ParagonStars:setLeftRight( true, false, 6, 193 )
	ParagonStars:setTopBottom( false, true, -22, -6 )
	ParagonStars:setWidgetType( CoD.Prestige_ParagonMilestoneIcon )
	ParagonStars:setHorizontalCount( 10 )
	ParagonStars:setSpacing( 3 )
	ParagonStars:setDataSource( "PrestigeMasterTiers" )
	LUI.OverrideFunction_CallOriginalFirst( ParagonStars, "setState", function ( element, controller )
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( ParagonStars )
	self.ParagonStars = ParagonStars
	
	local Bar2 = LUI.UIImage.new()
	Bar2:setLeftRight( true, true, 0, 0 )
	Bar2:setTopBottom( true, false, -2.12, 8.12 )
	Bar2:setRGB( 1, 0.75, 0.3 )
	Bar2:setImage( RegisterImage( "uie_t7_icon_mp_masterprestige_rankbar" ) )
	Bar2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Bar2:setShaderVector( 0, 0, 0.4, 0, 0.4 )
	self:addElement( Bar2 )
	self.Bar2 = Bar2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Bar:completeAnimation()
				self.Bar:setAlpha( 0 )
				self.clipFinished( Bar, {} )
				ParagonStars:completeAnimation()
				self.ParagonStars:setAlpha( 0 )
				self.clipFinished( ParagonStars, {} )
				Bar2:completeAnimation()
				self.Bar2:setAlpha( 0 )
				self.clipFinished( Bar2, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Bar:completeAnimation()
				self.Bar:setAlpha( 1 )
				self.clipFinished( Bar, {} )
				ParagonStars:completeAnimation()
				self.ParagonStars:setAlpha( 1 )
				self.clipFinished( ParagonStars, {} )
				Bar2:completeAnimation()
				self.Bar2:setAlpha( 1 )
				self.clipFinished( Bar2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ParagonStars:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

